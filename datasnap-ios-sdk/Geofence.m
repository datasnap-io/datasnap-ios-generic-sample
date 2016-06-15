//
//  GeoFence.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "GeoFence.h"

@implementation Geofence
@synthesize identifier;
@synthesize name;
@synthesize visibility;
@synthesize tags;
@synthesize geofenceCircle;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"id" : self.identifier,
        @"name" : self.name,
        @"visibility" : self.visibility,
        @"tags" : [self.tags convertToDictionary],
        @"geofence_circle" : [self.geofenceCircle convertToDictionary]
    };
    return dictionary;
}
@end
