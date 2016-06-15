//
//  GeofenceCircle.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "GeofenceCircle.h"

@implementation GeofenceCircle
@synthesize radius;
@synthesize location;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"radius" : self.radius,
        @"location" : [self.location convertToDictionary]
    };
    return dictionary;
}
@end
