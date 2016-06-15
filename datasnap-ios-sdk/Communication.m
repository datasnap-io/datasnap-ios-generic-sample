//
//  Communication.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/6/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Communication.h"

@implementation Communication
@synthesize description;
@synthesize identifier;
@synthesize title;
@synthesize types;
@synthesize content;
@synthesize status;
@synthesize communicationVendorId;
@synthesize tags;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"description" : self.description,
        @"id" : self.identifier,
        @"title" : self.title,
        @"types" : [self.types convertToDictionary],
        @"content" : [self.content convertToDictionary],
        @"status" : self.status,
        @"communication_vendor_id" : self.communicationVendorId,
        @"tags" : [self.tags convertToDictionary]
    };
    return dictionary;
}
@end
