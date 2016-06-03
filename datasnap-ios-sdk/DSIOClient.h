//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//
#import "DSIOEventQueue.h"
#import "Event+Management.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DSIOClient : NSObject
@property (nonatomic, strong) NSString* organizationID;
@property (nonatomic, strong) DSIOEventQueue* eventQueue;
@property NSInteger eventQueueSize;
@property (nonatomic, strong) NSString* projectID;
+ (void)setupWithOrgID:(NSString*)organizationID projectId:(NSString*)projectID APIKey:(NSString*)APIKey
             APISecret:(NSString*)APISecret
               logging:(BOOL)logging
              eventNum:(int)eventNum;

/**
 Event Handlers
 */
- (void)flushEvents;
- (void)genericEvent:(NSMutableDictionary*)eventDetails;
- (void)checkQueue;
/**
 Enable Logging
 */
+ (void)debug:(BOOL)showDebugLogs;

+ (id)sharedClient;
- (NSDictionary*)deviceInfo;
- (NSString*)version;
@end
