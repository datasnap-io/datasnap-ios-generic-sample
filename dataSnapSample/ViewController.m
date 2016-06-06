//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import "DSIOClient.h"
#import "ViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <Gimbal/Gimbal.h>

// Unique user ID
static NSString* global_distinct_id = @"2qM5ckFqzFCcCIdY7xYhBc";
static NSString* mobile_device_ios_idfa;

NSString* currentDate()
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSDate* date = [NSDate new];
    NSString* formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (NSString*)identifierForAdvertising
{
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID* IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        return [IDFA UUIDString];
    }
    return nil;
}

- (void)viewDidLoad
{
    mobile_device_ios_idfa = [self identifierForAdvertising]; // Assign IDFA
    [self logToDeviceAndConsole:mobile_device_ios_idfa];
    [DSIOGimbalClient setupWithOrgID:@"19CYxNMSQvfnnMf1QS4b3Z"
                           projectId:@"TestApplication2"
                              APIKey:@"3F34FXD78PCINFR99IYW950W4"
                           APISecret:@"KA0HdzrZzNjvUq8OnKQoxaReyUayZY0ckNYoMZURxK8"
                             logging:true
                            eventNum:1
                                  id:global_distinct_id
                            mobileId:mobile_device_ios_idfa];
    self.beaconManager = [GMBLBeaconManager new];
    self.beaconManager.delegate = [DSIOGimbalClient sharedClient];
    [self.beaconManager startListening];
    self.communicationManager = [GMBLCommunicationManager new];
    self.communicationManager.delegate = [DSIOGimbalClient sharedClient];
    [GMBLPlaceManager startMonitoring];
    [GMBLCommunicationManager startReceivingCommunications];
}

- (void)logToDeviceAndConsole:(NSString*)eventName
{
    NSString* message = [NSString stringWithFormat:@"%@ %@\n", eventName, currentDate()];
    NSLog(@"%@", message);
}

/**
 * Example of a beacon sighting
 */
- (void)exampleBeaconSighting
{
    NSDictionary* beaconData = @{ @"event_type" : @"beacon_sighting",
        @"beacon" : @{ @"identifier" : @"3333333",
            @"rssi" : @-20 },
        @"user" : @{
            @"id" : @{ @"global_distinct_id" : global_distinct_id,
                @"mobile_device_ios_idfa" : mobile_device_ios_idfa },
        },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Sighting Event"];
}

/**
 * Example of a beacon arrival
 */
- (void)exampleBeaconArrive
{
    NSDictionary* beaconData = @{ @"event_type" : @"beacon_arrive",
        @"beacon" : @{ @"identifier" : @"3333333",
            @"rssi" : @(-40) },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Arrival Event"];
}

/**
 * Example of a beacon depart
 */
- (void)exampleBeaconDepart
{
    NSDictionary* beaconData = @{ @"event_type" : @"beacon_depart",
        @"beacon" : @{ @"identifier" : @"3333333",
            @"rssi" : @-50 },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Departure Event"];
}

/**
 * Example of a geofence arrival
 */
- (void)exampleGeofenceArrive
{
    NSDictionary* beaconData = @{ @"event_type" : @"geofence_arrive",
        @"geofence" : @{ @"identifier" : @"44444444" },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Geofence Arrival Event"];
}

/**
 * Example of a geofence depart
 */
- (void)exampleGeofenceDepart
{
    NSDictionary* beaconData = @{ @"event_type" : @"geofence_depart",
        @"geofence" : @{ @"identifier" : @"44444444" },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Geofence Departure Event"];
}

/**
 * Example of a GPS based sighting 
 */
- (void)exampleGPSSighting
{
    NSDictionary* beaconData = @{ @"event_type" : @"global_position_sighting",
        @"location" : @{ @"coordinates" : @[ @"32.89545949009762, -117.19463284827117" ] },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example GPS Sighting Event"];
}

/*
 * Example of campaign communication report
 */
- (void)exampleCampaignEvent
{
    NSDictionary* event = @{ @"event_type" : @"ds_communication_sent",
        @"campaign" : @{ @"identifier" : @"3333333",
            @"advertiser_org_id" : @"advorgid",
            @"status" : @"background",
            @"project_id" : @"projectId" },
        @"communication" : @{ @"identifier" : @"3333333",
            @"advertiser_org_id" : @"advorgid" },
        @"user" : @{ @"id" : @{ @"global_distinct_id" : global_distinct_id,
                                @"mobile_device_ios_idfa" : mobile_device_ios_idfa } },
        @"datasnap" : @{ @"created" : currentDate() } };

    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary*)event];
    [self logToDeviceAndConsole:@"Datasnap Example Campaign Communication Event"];
}
- (IBAction)beaconSightingButtonTouched:(id)sender
{
    [self exampleBeaconSighting];
}
- (IBAction)beaconArrivalButtonTouched:(id)sender
{
    [self exampleBeaconArrive];
}
- (IBAction)beaconDepartButtonTouched:(id)sender
{
    [self exampleBeaconDepart];
}
- (IBAction)geofenceDepartButtonTouched:(id)sender
{
    [self exampleGeofenceDepart];
}
- (IBAction)campaignEventButtonTouched:(id)sender
{
    [self exampleCampaignEvent];
}

@end