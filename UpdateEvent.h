//
//  UpdateEvent.h
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 6/8/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//
#import "BaseEvent.h"
#import "Beacon.h"
#import "Place.h"
#import <Foundation/Foundation.h>

@interface UpdateEvent : BaseEvent
@property Beacon* beacon;
@property Place* place;
@end
