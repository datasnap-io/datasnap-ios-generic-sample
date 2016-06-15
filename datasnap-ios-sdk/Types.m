//
//  Types.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Types.h"

@implementation Types
@synthesize id;
@synthesize name;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"id" : self.id,
        @"name" : self.name
    };
    return dictionary;
}
@end
