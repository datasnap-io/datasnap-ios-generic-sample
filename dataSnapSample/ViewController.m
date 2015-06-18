//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import "ViewController.h"
#import <Datasnap/DSIOClient.h>
#import "UserIDStore.h"

// Unique user ID
static NSString *global_distinct_id = @"2qM5ckFqzFCcCIdY7xYhBc";

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {

    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(callEvents)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)logToDeviceAndConsole:(NSString *)eventName{
    NSString *message = [NSString stringWithFormat:@"%@ %@\n", eventName, currentDate()];
    NSLog(@"%@", message);
    DeviceLog(@"%@", message);
}

- (void)callEvents {
    
    [self exampleBeaconArrive];

}

/**
 * Example of a beacon sighting
 */
- (void)exampleBeaconSighting {
    NSDictionary *beaconData = @{@"event_type" : @"beacon_sighting",
                                 @"beacon" : @{@"identifier": @"3333333"},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Sighting Event"];
}

/**
 * Example of a beacon arrival
 */
- (void)exampleBeaconArrive {
    NSDictionary *beaconData = @{@"event_type" : @"beacon_arrive",
                                 @"beacon" : @{@"identifier": @"3333333"},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Arrival Event"];
}

/**
 * Example of a beacon arrival
 */
- (void)exampleBeaconDepart {
    NSDictionary *beaconData = @{@"event_type" : @"beacon_depart",
                                 @"beacon" : @{@"identifier": @"3333333"},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Beacon Departure Event"];
}

/**
 * Example of a geofence arrival
 */
- (void)exampleGeofenceArrive {
    NSDictionary *beaconData = @{@"event_type" : @"geofence_arrive",
                                 @"geofence" : @{@"identifier": @"44444444"},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Geofence Arrival Event"];
}

/**
 * Example of a geofence arrival
 */
- (void)exampleGeofenceDepart {
    NSDictionary *beaconData = @{@"event_type" : @"geofence_depart",
                                 @"geofence" : @{@"identifier": @"44444444"},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example Geofence Departure Event"];
}

/**
 * Example of a geofence arrival
 */
- (void)exampleGPSSighting {
    NSDictionary *beaconData = @{@"event_type" : @"global_position_sighting",
                                 @"location" : @{@"coordinates" : @[@"32.89545949009762, -117.19463284827117"]},
                                 @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                 @"datasnap": @{@"created": currentDate()}};
    
    [[DSIOClient sharedClient] genericEvent:(NSMutableDictionary *)beaconData];
    [self logToDeviceAndConsole:@"Datasnap Example GPS Sighting Event"];
}


@end


