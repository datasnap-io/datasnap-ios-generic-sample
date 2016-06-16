//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//
#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad
{
    self.datasnap = [DataSnap sharedClient];
}
- (IBAction)beaconSightingButtonTouched:(id)sender
{
    BeaconEvent* beaconEvent = [[BeaconEvent alloc] init];
    beaconEvent.eventType = @"beacon_sighting";
    [self.datasnap trackEvent:beaconEvent];
}
- (IBAction)beaconArrivalButtonTouched:(id)sender
{
    BeaconEvent* beaconEvent = [[BeaconEvent alloc] init];
    beaconEvent.eventType = @"beacon_sighting";
    [self.datasnap trackEvent:beaconEvent];
}
- (IBAction)beaconDepartButtonTouched:(id)sender
{
    BeaconEvent* beaconEvent = [[BeaconEvent alloc] init];
    beaconEvent.eventType = @"beacon_depart";
    [self.datasnap trackEvent:beaconEvent];
}
- (IBAction)geofenceDepartButtonTouched:(id)sender
{
    GeoFenceEvent* geoFenceEvent = [[GeoFenceEvent alloc] init];
    geoFenceEvent.eventType = @"geofence_depart";
    [self.datasnap trackEvent:geoFenceEvent];
}

@end