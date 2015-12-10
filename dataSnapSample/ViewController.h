//
// Copyright (c) 2015 Datasnapio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property IBOutlet UITextField *deviceDisplay;

@end

#define DeviceLog(message, ...) self.deviceDisplay.text = [[NSString stringWithFormat:message, ##__VA_ARGS__] stringByAppendingString:self.deviceDisplay.text]