//
//  GlobalPosition.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "GlobalPosition.h"

@implementation GlobalPosition
@synthesize location;
@synthesize altitude;
@synthesize accuracy;
@synthesize course;
@synthesize speed;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"location" : [self.location convertToDictionary],
        @"altitude" : self.altitude,
        @"accuracy" : self.accuracy,
        @"course" : self.course,
        @"speed" : self.speed
    };
    return dictionary;
}
@end
