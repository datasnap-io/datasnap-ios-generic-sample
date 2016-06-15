//
//  BeaconEvent.h
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//
#import "BaseEvent.h"
#import "Beacon.h"
#import "DeviceInfo.h"
#import "EventEntity.h"
#import "Place.h"
#import "User.h"
#import <Foundation/Foundation.h>

@interface BeaconEvent : BaseEvent
@property Place* place;
@property Beacon* beacon;
@end
