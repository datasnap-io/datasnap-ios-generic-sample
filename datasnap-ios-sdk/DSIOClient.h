//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//
#import "Event+Management.h"
#import <Foundation/Foundation.h>

@interface DSIOClient : NSObject

+ (void)setupWithOrgID:(NSString*)organizationID projectId:(NSString*)projectID APIKey:(NSString*)APIKey
             APISecret:(NSString*)APISecret
               logging:(BOOL)logging
              eventNum:(int)eventNum;

/**
 Event Handlers
 */
- (void)flushEvents;
- (void)genericEvent:(NSMutableDictionary*)eventDetails;

/**
 Enable Logging
 */
+ (void)debug:(BOOL)showDebugLogs;

+ (id)sharedClient;

+ (NSString*)version;
@end
