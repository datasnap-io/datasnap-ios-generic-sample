
#import "SettingsViewController.h"

#import <Gimbal/Gimbal.h>

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *placeMonitoringSwitch;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.placeMonitoringSwitch setOn:[GMBLPlaceManager isMonitoring] animated:NO];
}

- (IBAction)toggledPlaceMonitoringSwitch:(UISwitch *)sender
{
    if (sender.isOn)
    {
        [GMBLPlaceManager startMonitoring];
    }
    else
    {
        [GMBLPlaceManager stopMonitoring];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0)
    {
        [Gimbal resetApplicationInstanceIdentifier];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
