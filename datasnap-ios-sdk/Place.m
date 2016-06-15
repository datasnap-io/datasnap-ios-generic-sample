//
//  Place.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize id;
@synthesize name;
@synthesize address;
@synthesize lastPlace;
@synthesize beacons;
@synthesize geofences;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"id" : self.id,
        @"name" : self.name,
        @"address" : self.address,
        @"last_place" : self.lastPlace,
        @"beacons" : self.beacons,
        @"geofences" : self.geofences
    };
    return dictionary;
}
@end
