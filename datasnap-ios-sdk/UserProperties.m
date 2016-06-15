//
//  UserProperties.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "UserProperties.h"

@implementation UserProperties
@synthesize userType;
@synthesize high;
@synthesize engagementTime;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{ @"user_type" : self.userType,
        @"high" : self.high,
        @"engagement_type" : self.engagementTime
    };
    return dictionary;
}
@end
