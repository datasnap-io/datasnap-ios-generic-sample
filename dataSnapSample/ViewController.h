//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *beaconSightingButton;
@property (weak, nonatomic) IBOutlet UIButton *beaconArrivalButton;
@property (weak, nonatomic) IBOutlet UIButton *beaconDepartButton;
@property (weak, nonatomic) IBOutlet UIButton *geofenceDepartButton;
@property (weak, nonatomic) IBOutlet UIButton *campaignEventButton;
@property (weak, nonatomic) IBOutlet UILabel *successLabel;

@end

#define DeviceLog(message, ...) self.deviceDisplay.text = [self.deviceDisplay.text stringByAppendingString:[NSString stringWithFormat:message, ##__VA_ARGS__]]