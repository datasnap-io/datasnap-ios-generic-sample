//
//  Identifier.h
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "EventProperty.h"

@interface Identifier : EventProperty
@property NSString* mobileDeviceBluetoothIdentifier;
@property NSString* mobileDeviceIosIdfa;
@property NSString* mobileDeviceIosOpenidfa;
@property NSString* mobileDeviceIosUdid;
@property NSString* datasnapUuid;
@property NSString* webDomainUserid;
@property NSString* webCookie;
@property NSString* domainSessionid;
@property NSString* webNetworkUserid;
@property NSString* webUserFingerprint;
@property NSString* webAnalyticsCompanyZCookie;
@property NSString* globalDistinctId;
@property NSString* globalUserIpaddress;
@property NSString* mobileDeviceFingerprint;
@property NSString* facebookUuid;
@property NSString* mobileDeviceGoogleAdvertisingId;
@property NSString* mobileDeviceGoogleAdvertisingIdOptIn;
@property NSString* unknown;
- (NSDictionary*)convertToDictionary;
@end
