//
//  User.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize tags;
@synthesize identifier;
@synthesize audience;
@synthesize userProperties;

- (void)initializeUser:(User*)user
{
    self.user = user;
}

- (User*)getInstance
{
    return self.user;
}

- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{ @"tags" : [self.tags convertToDictionary],
        @"id:" : [self.identifier convertToDictionary],
        @"audience" : self.audience,
        @"user_properties" : [self.userProperties convertToDictionary]
    };
    return dictionary;
}
@end
