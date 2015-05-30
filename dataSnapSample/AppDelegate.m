//
//  Copyright (c) 2014 Datasnap.io. All rights reserved.
//  Datasnap Generic Sample

#import "AppDelegate.h"

#import <AdSupport/ASIdentifierManager.h>

#import "DSIOClient.h"

#import "UAirship.h"
#import "UAConfig.h"

#import "UserIDStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DSIOClient setupWithOrgID:@"2qM5ckFqzFCcCIdY7xYhBc"
                     projectId:@"TestApplication2"
                        APIKey:@"5Z0TKJ8GLZOR40IU4CBOEH78B"
                     APISecret:@"PDGIbwW25CbUkRSIp/OOB+WniDDudG/Pu+jfjzAEfwQ"
                       logging:true
                      eventNum:1];
    
    UAConfig *uaConfig = [UAConfig defaultConfig];
    uaConfig.developmentLogLevel = UALogLevelDebug;
    [UAirship takeOff:uaConfig];
    
     UA_LDEBUG(@"Config:\n%@", [uaConfig description]);
    
    [UAirship push].userPushNotificationsEnabled = YES;
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    [UAirship push].pushNotificationDelegate = self;
    
    [[UserIDStore sharedInstance] setVenderID:idfv];
    [[UserIDStore sharedInstance] setAdversiterID:adId];

    return YES;
    }

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_sent",
                                                           @"communication": @{@"identifier":@"",
                                                                               @"description":@""},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)didRecieveNotification:(NSDictionary *)notification {
    
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
    
    
}


- (void)didRecieveRemoteNotification:(NSDictionary *)notification {
    
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
     NSLog(@"didRecieveRemoteNotification: %@", notification);
    
}

- (void)didNotSendNotification:(NSDictionary *)notification {
    
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_not_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
    
    
}

- (void)didOpenNotification:(NSDictionary *)notification {
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_open",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]}},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
}



- (void)launchedFromNotification:(NSDictionary *)notification {
    // Called when opened communication
    NSLog(@"launchedFromNotification: %@", notification);
    [self didOpenNotification:notification];
}

- (void)receivedBackgroundNotification:(NSDictionary *)notification
                fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"receivedBackgroundNotification: %@", notification);
    NSString *tag = [notification objectForKey:@"^+t"];
    
    if(![tag  isEqual: @"DS_ABTest"]){
        NSLog(@"tag NOT found: DS_ABTest" );
        [self didRecieveNotification:notification];
        completionHandler(UIBackgroundFetchResultNoData);
    }else{
        //put code here to segment users into two groups equally, one to send the event and one to not send the events ang log
        // events accordingly:  ds_communication_not_sent  ds_communication_not_sent
        
    }
    
    
}

- (void)receivedForegroundNotification:(NSDictionary *)notification
                fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"receivedForegroundNotification: %@", notification);
    
    NSString *tag = [notification objectForKey:@"^+t"];
    
    if(![tag  isEqual: @"DS_ABTest"]){
        NSLog(@"tag NOT found: DS_ABTest" );
        [self didRecieveNotification:notification];
        completionHandler(UIBackgroundFetchResultNoData);
    }else{
        //put code here to segment users into two groups equally, one to send the event and one to not send the events ang log
       // events accordingly:  ds_communication_not_sent  ds_communication_not_sent
        
    }
}

@end
