//
//  Copyright (c) 2014 Datasnap.io. All rights reserved.
//  Datasnap Generic Sample

@import Foundation;

NSString *currentDate();

@interface UserIDStore : NSObject

@property NSString *venderID;
@property NSString *adversiterID;

/**
 * gets singleton object.
 * @return singleton
 */
+ (UserIDStore*)sharedInstance;

@end
