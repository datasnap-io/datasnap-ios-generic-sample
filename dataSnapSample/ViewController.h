//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import "BaseEvent.h"
#import "DataSnap.h"
#import "GeoFenceEvent.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton* beaconSightingButton;
@property (weak, nonatomic) IBOutlet UIButton* beaconArrivalButton;
@property (weak, nonatomic) IBOutlet UIButton* beaconDepartButton;
@property (weak, nonatomic) IBOutlet UIButton* geofenceDepartButton;
@property (weak, nonatomic) DataSnap* datasnap;
@end
