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
    uaConfig.automaticSetupEnabled = NO;
    [UAirship takeOff:uaConfig];
    
     UA_LDEBUG(@"Config:\n%@", [uaConfig description]);
    
    [UAirship push].userPushNotificationsEnabled = YES;
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    [UAirship push].pushNotificationDelegate = self;
    
    [[UserIDStore sharedInstance] setVenderID:idfv];
    [[UserIDStore sharedInstance] setAdversiterID:adId];
    
    
    // These three lines are just to prove that i can set tags for a device via tghe SDK and the behaviour of tags in general. It looks like pulling a campaign automatically tags the device with the tags used to flight
    // the campaign.
    NSLog(@"Device Tags Currently Registered::::: %@", [UAirship push].tags);
    [UAirship push].tags = @[@"DS_Employee", @"VIP"];
    [[UAirship push] updateRegistration];
    
    
    
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
    
    
    NSMutableDictionary *tempDic = [[notification objectForKey:@"aps"] objectForKey:@"alert"];
    NSString *title = [tempDic objectForKey:@"title"];
    
    
    // campaign and communication have the same identifiers here since there is no concept of a campaign having multiple communications/creatives.
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"name":title,
                                                                               @"description":title},
                                                           @"campaign": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"name":title,
                                                                               @"description":title},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]},
                                                                      @"tags": [UAirship push].tags},
                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    NSLog(@"local notification and application is active");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Urban Airship Event"
                                                    message:title
                                                   delegate:self
                                          cancelButtonTitle:@"Yes"
                                          otherButtonTitles:@"No",nil];
    [alert show];
    
    UILocalNotification *backupAlarm = [[UILocalNotification alloc] init];
    NSDate *dateTime;
    backupAlarm.fireDate = dateTime;
    backupAlarm.alertBody = title;
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification: backupAlarm];
    
}


- (void)didRecieveRemoteNotification:(NSDictionary *)notification {
    
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"campaign": @{@"identifier":[notification objectForKey:@"_"],
                                                                          @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]},
                                                                      @"tags": [UAirship push].tags},

                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
     NSLog(@"didRecieveRemoteNotification: %@", notification);
    
}

- (void)didNotSendNotification:(NSDictionary *)notification {
    
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_not_sent",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"campaign": @{@"identifier":[notification objectForKey:@"_"],
                                                                          @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]},
                                                                      @"tags": [UAirship push].tags},

                                                           @"datasnap": @{@"created": currentDate()}}];
    [[DSIOClient sharedClient] genericEvent:eventData];
    
    
    
    
}

- (void)didOpenNotification:(NSDictionary *)notification {
    NSMutableDictionary *eventData = [[NSMutableDictionary alloc]
                                      initWithDictionary:@{@"event_type": @"ds_communication_open",
                                                           @"communication": @{@"identifier":[notification objectForKey:@"_"],
                                                                               @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"campaign": @{@"identifier":[notification objectForKey:@"_"],
                                                                          @"description":[[notification objectForKey:@"aps"] objectForKey:@"alert"]},
                                                           @"user": @{@"id": @{@"global_distinct_id": [[UserIDStore sharedInstance] adversiterID]},
                                                                      @"tags": [UAirship push].tags},
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
    
    // Do something with the notification in the background
    
    // Be sure to call the completion handler with a UIBackgroundFetchResult
    completionHandler(UIBackgroundFetchResultNoData);
}


- (void)receivedForegroundNotification:(NSDictionary *)notification {
    NSLog(@"receivedForegroundNotification: %@", notification);
    
    NSString *tag = [notification objectForKey:@"^+t"];
    
    if(![tag  isEqual: @"DS_ABTest"]){
        NSLog(@"tag NOT found: DS_ABTest" );
        [self didRecieveNotification:notification];
    
    }else{
        //put code here to segment users into two groups equally, one to send the event and one to not send the events ang log
       // events accordingly:  ds_communication_not_sent  ds_communication_not_sent
        
    }
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    UA_LTRACE(@"Application registered for remote notifications with device token: %@", deviceToken);
    [[UAirship push] appRegisteredForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    UA_LTRACE(@"Application did register with user notification types %ld", (unsigned long)notificationSettings.types);
    [[UAirship push] appRegisteredUserNotificationSettings];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *) error {
    UA_LERR(@"Application failed to register for remote notifications with error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    UA_LINFO(@"Application received remote notification no handler: %@", userInfo);
    //[[UAirship push] appReceivedRemoteNotification:userInfo applicationState:application.applicationState];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    UA_LINFO(@"Application received remote notification fetchCompletionHandler: %@", userInfo);
    //[[UAirship push] appReceivedRemoteNotification:userInfo applicationState:application.applicationState fetchCompletionHandler:completionHandler];
    
    
    
    NSString *tag = [userInfo objectForKey:@"DS_LIFT"];
    
    if(![tag  isEqual: @"OFF"]){
        NSLog(@"DS_LIFT OFF" );
        [self didRecieveNotification:userInfo];
        
    }else{
         NSLog(@"tag FOUND PROCESSING A/B: DS_LIFT ON" );
        //put code here to segment users into two groups equally, one to send the event and one to not send the events ang log
        // events accordingly:  ds_communication_not_sent  ds_communication_not_sent
        
        
        
        
    }
    
    
    
    
    
    
    completionHandler(UIBackgroundFetchResultNoData);
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())handler {
    UA_LINFO(@"Received remote notification button interaction: %@ notification: %@", identifier, userInfo);
    //[[UAirship push] appReceivedActionWithIdentifier:identifier notification:userInfo applicationState:application.applicationState completionHandler:handler];
}






@end
