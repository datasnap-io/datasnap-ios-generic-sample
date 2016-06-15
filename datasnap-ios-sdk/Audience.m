//
//  Audience.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Audience.h"

@implementation Audience
@synthesize education;
@synthesize college;
@synthesize age;
@synthesize ethnicity;
@synthesize kids;
@synthesize gender;
@synthesize interests;
@synthesize income;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"education" : self.education,
        @"college" : self.college,
        @"age" : self.age,
        @"ethnicity" : self.ethnicity,
        @"kids" : self.kids,
        @"gender" : self.gender,
        @"interests" : self.interests,
        @"income" : self.income
    };
    return dictionary;
}
@end
