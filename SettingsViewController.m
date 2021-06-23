//
//  SettingsViewController.m
//  Tipster
//
//  Created by Ava Crnkovic-Rubsamen on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;
@property (weak, nonatomic) IBOutlet UILabel *settingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void) viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipIndex = [defaults integerForKey:@"default_tip"];
    self.defaultTipControl.selectedSegmentIndex = tipIndex;
    NSInteger themeIndex = [defaults integerForKey:@"default_theme"];
    self.themeControl.selectedSegmentIndex = themeIndex;
    
    UIColor *myYellow = [UIColor colorWithRed:1.0 green:252/255.0 blue:204/255.0 alpha:1.0];
    
    if(themeIndex == 0) { // light theme
        self.view.backgroundColor = myYellow;
        self.defaultTipControl.backgroundColor = myYellow;
        self.themeControl.backgroundColor = myYellow;
        self.settingsLabel.textColor = [UIColor darkGrayColor];
        self.tipLabel.textColor = [UIColor darkGrayColor];
        self.themeLabel.textColor = [UIColor darkGrayColor];
    }
    else {
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.defaultTipControl.backgroundColor = [UIColor lightGrayColor];
        self.themeControl.backgroundColor = myYellow;
        self.settingsLabel.textColor = myYellow;
        self.tipLabel.textColor = myYellow;
        self.themeLabel.textColor = myYellow;
    }
}

- (IBAction)updateDefault:(id)sender {
    
    NSInteger tip = self.defaultTipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tip forKey:@"default_tip"];
    [defaults synchronize];
    
}

- (IBAction)updateTheme:(id)sender {
    
    NSInteger theme = self.themeControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:theme forKey:@"default_theme"];
    [defaults synchronize];
    
    UIColor *myYellow = [UIColor colorWithRed:1.0 green:252/255.0 blue:204/255.0 alpha:1.0];
    
    if(theme == 0) {
        self.view.backgroundColor = myYellow;
        self.defaultTipControl.backgroundColor = myYellow;
        self.themeControl.backgroundColor = myYellow;
        self.settingsLabel.textColor = [UIColor darkGrayColor];
        self.tipLabel.textColor = [UIColor darkGrayColor];
        self.themeLabel.textColor = [UIColor darkGrayColor];
    }
    else {
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.defaultTipControl.backgroundColor = [UIColor lightGrayColor];
        self.themeControl.backgroundColor = myYellow;
        self.settingsLabel.textColor = myYellow;
        self.tipLabel.textColor = myYellow;
        self.themeLabel.textColor = myYellow;
    }
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
