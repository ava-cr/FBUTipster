//
//  TipViewController.m
//  Tipster
//
//  Created by Ava Crnkovic-Rubsamen on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UILabel *halfTotal;
@property (weak, nonatomic) IBOutlet UILabel *thirdTotal;
@property (weak, nonatomic) IBOutlet UILabel *fourthTotal;
@property (weak, nonatomic) IBOutlet UILabel *firstTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthTotalLabel;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideLabels];
}

-(void) viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [defaults integerForKey:@"default_tip"];
    self.tipPercentageControl.selectedSegmentIndex = index;
    
    
    NSInteger themeIndex = [defaults integerForKey:@"default_theme"];
    
    UIColor *myYellow = [UIColor colorWithRed:1.0 green:252/255.0 blue:204/255.0 alpha:1.0];
    
    if(themeIndex == 0) { // light theme
        self.view.backgroundColor = myYellow;
        
        self.billField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"$" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
        self.labelsContainerView.backgroundColor = myYellow;
        self.tipPercentageControl.backgroundColor = myYellow;
        self.billField.textColor = [UIColor darkGrayColor];
        self.tipLabel.textColor = [UIColor darkGrayColor];
        self.totalLabel.textColor = [UIColor darkGrayColor];
        self.halfTotal.textColor = [UIColor darkGrayColor];
        self.thirdTotal.textColor = [UIColor darkGrayColor];
        self.fourthTotal.textColor = [UIColor darkGrayColor];
        self.firstTotalLabel.textColor = [UIColor darkGrayColor];
        self.secondTotalLabel.textColor = [UIColor darkGrayColor];
        self.thirdTotalLabel.textColor = [UIColor darkGrayColor];
        self.fourthTotalLabel.textColor = [UIColor darkGrayColor];
    }
    else {
        self.billField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"$" attributes:@{NSForegroundColorAttributeName: myYellow}];
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.labelsContainerView.backgroundColor = [UIColor darkGrayColor];
        self.tipPercentageControl.backgroundColor = [UIColor lightGrayColor];
        self.billField.textColor = myYellow;
        self.tipLabel.textColor = myYellow;
        self.totalLabel.textColor = myYellow;
        self.halfTotal.textColor = myYellow;
        self.thirdTotal.textColor = myYellow;
        self.fourthTotal.textColor = myYellow;
        self.firstTotalLabel.textColor = myYellow;
        self.secondTotalLabel.textColor = myYellow;
        self.thirdTotalLabel.textColor = myYellow;
        self.fourthTotalLabel.textColor = myYellow;
    }
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:true];
    [self showLabels];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billField.text.length == 0) {
        [self hideLabels];
    }
    else {
        NSLog(@"show labels");
        [self showLabels];
        
    }
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
// add individual totals for groups
    self.halfTotal.text = [NSString stringWithFormat:@"$%.2f", total/2];
    self.thirdTotal.text = [NSString stringWithFormat:@"$%.2f", total/3];
    self.fourthTotal.text = [NSString stringWithFormat:@"$%.2f", total/4];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        
        self.billField.frame = billFrame;
        
//        CGRect labelsFrame = self.labelsContainerView.frame;
//        labelsFrame.origin.y += 200;
//        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.hidden = true;
        
//        self.labelsContainerView.alpha = 0;
    }];
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y = 100;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 200;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.hidden = false;
        
//        self.labelsContainerView.alpha = 1;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
