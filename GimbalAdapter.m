/*
 * Copyright 2015 Urban Airship and Contributors
 */

#import "GimbalAdapter.h"
#import "UAPush.h"
#import "UAirship.h"
#import "UARegionEvent.h"
#import "UAAnalytics.h"
#import <Datasnap/DSIOClient.h>

#define kSource @"Gimbal"

@interface GimbalAdapter ()

@property (assign) BOOL started;
@property (nonatomic) GMBLPlaceManager *placeManager;
@property (nonatomic) GMBLBeaconManager *beaconManager;

@end

@implementation GimbalAdapter

- (instancetype)init {
    self = [super init];
    if (self) {
        self.placeManager = [[GMBLPlaceManager alloc] init];
        self.placeManager.delegate = self;
        
        self.beaconManager = [GMBLBeaconManager new];
        self.beaconManager.delegate = self;

        // Hide the power alert by default
        if (![[NSUserDefaults standardUserDefaults] valueForKey:@"gmbl_hide_bt_power_alert_view"]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"gmbl_hide_bt_power_alert_view"];
        }
    }

    return self;
}

NSString *currentDate() {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSDate *date = [NSDate new];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

- (void)dealloc {
    self.placeManager.delegate = nil;
}

+ (instancetype)shared {
    static dispatch_once_t onceToken = 0;

    __strong static id _sharedObject = nil;

    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });

    return _sharedObject;
}

- (BOOL)isBluetoothPoweredOffAlertEnabled {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:@"gmbl_hide_bt_power_alert_view"];
}

- (void)setBluetoothPoweredOffAlertEnabled:(BOOL)bluetoothPoweredOffAlertEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:!bluetoothPoweredOffAlertEnabled
                                            forKey:@"gmbl_hide_bt_power_alert_view"];
}

- (void)startAdapter {

    if (self.started) {
        return;
    }

    [GMBLPlaceManager startMonitoring];
     [self.beaconManager startListening];

    self.started = YES;

    UA_LDEBUG(@"Started Gimbal Adapter.");
}

- (void)stopAdapter {

    if (self.started) {

        [GMBLPlaceManager stopMonitoring];
        self.started = NO;

        UA_LDEBUG(@"Stopped Gimbal Adapter.");
    }
}

- (void)reportPlaceEventToAnalytics:(GMBLPlace *) place boundaryEvent:(UABoundaryEvent) boundaryEvent {
    UARegionEvent *regionEvent = [UARegionEvent regionEventWithRegionID:place.identifier source:kSource boundaryEvent:boundaryEvent];


    
    //log datasnap analytics
    UA_LDEBUG(@"Gimbal Application Identifer for Device. %@", [Gimbal applicationInstanceIdentifier]);
    

    
    
    [[UAirship shared].analytics addEvent:regionEvent];
}

#pragma mark -
#pragma mark Gimbal places callbacks

- (void)placeManager:(GMBLPlaceManager *)manager didBeginVisit:(GMBLVisit *)visit {
    UA_LDEBUG(@"Entered a Gimbal Place: %@ on the following date: %@", visit.place.name, visit.arrivalDate);
    //add datasnap event here
    
    
    [self reportPlaceEventToAnalytics:visit.place boundaryEvent:UABoundaryEventEnter];
}

- (void)placeManager:(GMBLPlaceManager *)manager didEndVisit:(GMBLVisit *)visit {
    UA_LDEBUG(@"Exited a Gimbal Place: %@ Entrance date:%@ Exit Date:%@", visit.place.name, visit.arrivalDate, visit.departureDate);

    //add datasnap event here
    
    
    [self reportPlaceEventToAnalytics:visit.place boundaryEvent:UABoundaryEventExit];
}


/*
 For global_distinct_id is beter ot use something that you can share with urban airship as well like the urban airship device ID?
 */

- (void)beaconManager:(GMBLBeaconManager *)manager didReceiveBeaconSighting:(GMBLBeaconSighting *)sighting
{
    //This will be invoked when a user sights a beacon
    //UA_LDEBUG(@"Beacon sighting: %@", sighting);
    
    NSString *rssi = [NSString stringWithFormat:@"%d", (int)sighting.RSSI];
    NSDictionary *eventData = @{@"event_type" : @"beacon_sighting",
                                 @"beacon" : @{@"identifier": sighting.beacon.identifier,
                                               @"rssi" : rssi},
                                 @"user": @{@"id": @{@"global_distinct_id": [Gimbal applicationInstanceIdentifier]}},
                                 @"datasnap": @{@"created": currentDate()}
                                };
                                                           
    
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
}


@end
