//
//  Copyright (c) 2014 Datasnap.io. All rights reserved.
//  Datasnap Generic Sample
#import "AppDelegate.h"
#import "DataSnap.h"
#import "VendorProperties.h"
#import <Gimbal/Gimbal.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    VendorProperties* vendorProperties = [[VendorProperties alloc] init];
    vendorProperties.vendor = GIMBAL;
    vendorProperties.gimbalApiKey = @"74e344e9-9625-4b9d-96cf-e7805479d33c";
    NSString* apiKey = @"3F34FXD78PCINFR99IYW950W4";
    NSString* apiSecret = @"KA0HdzrZzNjvUq8OnKQoxaReyUayZY0ckNYoMZURxK8";
    [DataSnap setUpDataSnapWithApiKey:apiKey apiKeySecret:apiSecret organizationId:@"19CYxNMSQvfnnMf1QS4b3Z" projectId:@"21213f8b-8341-4ef3-a6b8-ed0f84945186" eventQueueSize:1 andVendorProperties:vendorProperties];
    return YES;
}
- (void)application:(UIApplication*)app
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [Gimbal setPushDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)app
    didFailToRegisterForRemoteNotificationsWithError:(NSError*)err
{
    NSLog(@"Error in registration. Error: %@", err);
}
- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
}

@end
