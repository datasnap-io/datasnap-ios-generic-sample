/*
 * Copyright 2015 Urban Airship and Contributors
  Please note Datasnap.io has made modifications to the original classes.
 
 Copy of the original license can be viewed here:
 
 https://github.com/urbanairship/ua-extensions/blob/master/COPYING
 
 */

#import <Foundation/Foundation.h>
#import <Gimbal/Gimbal.h>

/**
 * GimbalAdapter interfaces Gimbal SDK functionality with Urban Airship services.
 */
@interface GimbalAdapter : NSObject <GMBLPlaceManagerDelegate>

/**
 * Enables alert when Bluetooth is powered off. Defaults to NO.
 */
@property (nonatomic, assign, getter=isBluetoothPoweredOffAlertEnabled) BOOL bluetoothPoweredOffAlertEnabled;

/**
 * Returns the shared `GimbalAdapter` instance.
 *
 * @return The shared `GimbalAdapter` instance.
 */
+ (instancetype)shared;

/**
 * Starts Gimbal.
 */
- (void)startAdapter;

/**
 * Stops Gimbal.
 */
- (void)stopAdapter;

@end
