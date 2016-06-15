//
//  Beacon.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Beacon.h"

@implementation Beacon
@synthesize identifier;
@synthesize uuid;
@synthesize name;
@synthesize batteryLevel;
@synthesize temperature;
@synthesize bleVendorUuid;
@synthesize bleVendorId;
@synthesize rssi;
@synthesize isMobile;
@synthesize previousRssi;
@synthesize dwellTime;
@synthesize startTime;
@synthesize lastUpdateTime;
@synthesize latitude;
@synthesize longitude;
@synthesize visibility;
@synthesize hardware;
@synthesize tags;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"id" : self.identifier,
        @"uuid" : self.uuid,
        @"name" : self.name,
        @"battery_level" : self.batteryLevel,
        @"temperature" : self.temperature,
        @"ble_vendor_id" : self.bleVendorId,
        @"ble_vendor_uuid" : self.bleVendorUuid,
        @"rssi" : self.rssi,
        @"is_mobile" : self.isMobile,
        @"previous_rssi" : self.previousRssi,
        @"dwell_time" : self.dwellTime,
        @"start_time" : self.startTime,
        @"last_update_time" : self.lastUpdateTime,
        @"latitude" : self.latitude,
        @"longitude" : self.longitude,
        @"visibility" : self.visibility,
        @"hardware" : self.hardware,
        @"tags" : [self.tags convertToDictionary]
    };
    return dictionary;
}

@end
