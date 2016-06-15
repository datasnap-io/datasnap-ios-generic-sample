//
//  Identifier.m
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//

#import "Identifier.h"

@implementation Identifier
@synthesize mobileDeviceBluetoothIdentifier;
@synthesize mobileDeviceIosIdfa;
@synthesize mobileDeviceIosOpenidfa;
@synthesize mobileDeviceIosUdid;
@synthesize datasnapUuid;
@synthesize webDomainUserid;
@synthesize webCookie;
@synthesize domainSessionid;
@synthesize webNetworkUserid;
@synthesize webUserFingerprint;
@synthesize webAnalyticsCompanyZCookie;
@synthesize globalDistinctId;
@synthesize globalUserIpaddress;
@synthesize mobileDeviceFingerprint;
@synthesize facebookUuid;
@synthesize mobileDeviceGoogleAdvertisingId;
@synthesize mobileDeviceGoogleAdvertisingIdOptIn;
@synthesize unknown;
- (NSDictionary*)convertToDictionary
{
    NSDictionary* dictionary = @{
        @"mobile_device_bluetooth_identifier" : self.mobileDeviceBluetoothIdentifier,
        @"mobile_device_ios_idfa" : self.mobileDeviceIosIdfa,
        @"mobile_device_ios_open_idfa" : self.mobileDeviceIosOpenidfa,
        @"mobile_device_ios_udid" : self.mobileDeviceIosUdid,
        @"datasnap_uuid" : self.datasnapUuid,
        @"web_domain_user_id" : self.webDomainUserid,
        @"web_cookie" : self.webCookie,
        @"domain_session_id" : self.domainSessionid,
        @"web_network_user_id" : self.webNetworkUserid,
        @"web_user_fingerprint" : self.webUserFingerprint,
        @"web_analytics_company_z_cookie" : self.webAnalyticsCompanyZCookie,
        @"global_distinct_id" : self.globalDistinctId,
        @"global_user_id_address" : self.globalUserIpaddress,
        @"mobile_device_google_advertising_id" : self.mobileDeviceGoogleAdvertisingId,
        @"mobile_device_google_advertising_id_opt_in" : self.mobileDeviceGoogleAdvertisingIdOptIn,
        @"unknown" : self.unknown,
        @"facebook_uuid" : self.facebookUuid
    };
    return dictionary;
}
@end
