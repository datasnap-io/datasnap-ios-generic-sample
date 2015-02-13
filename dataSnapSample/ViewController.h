//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESTBeacon.h"

typedef enum : int
{
    ESTScanTypeBluetooth,
    ESTScanTypeBeacon

} ESTScanType;



@interface ViewController : UIViewController
@property IBOutlet UITextField *deviceDisplay;

@property(strong, nonatomic) IBOutlet UITextField *GarsTextField;

/*
 * Selected beacon is returned on given completion handler.
 */
- (id)initWithScanType:(ESTScanType)scanType completion:(void (^)(ESTBeacon *))completion;

-(void)deviceDisplay:(NSString *)string;

- (IBAction)textFieldReturn:(id)sender;

@end

#define DeviceLog(message, ...) self.deviceDisplay.text = [self.deviceDisplay.text stringByAppendingString:[NSString stringWithFormat:message, ##__VA_ARGS__]]
