//
//  SettingsViewController.m
//  Tipster
//
//  Created by Ava Crnkovic-Rubsamen on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [defaults integerForKey:@"default_tip"];
    self.defaultTipControl.selectedSegmentIndex = index;
}
- (IBAction)updateDefault:(id)sender {
    
    NSInteger tip = self.defaultTipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tip forKey:@"default_tip"];
    [defaults synchronize];
    
    
}


// #pragma mark - Navigation
/*

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */


@end
