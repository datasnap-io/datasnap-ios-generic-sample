//
//  Content.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Content.h"

@implementation Content
@synthesize text;
@synthesize description;
@synthesize image;
@synthesize html;
@synthesize url;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"text" : self.text,
        @"description" : self.description,
        @"image" : self.image,
        @"html" : self.html,
        @"url" : self.url
    };
    return dictionary;
}
@end
