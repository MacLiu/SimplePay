//
//  MakeBillViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "MakeBillViewController.h"

@interface MakeBillViewController ()<UITextFieldDelegate>

@end

@implementation MakeBillViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.amountTextField.delegate = self;
    self.itemTextField.delegate = self;
    self.descriptionTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)makeBillButtonPressed:(UIButton *)sender {
    if (self.itemTextField.text.length == 0 || self.amountTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please make sure all fields are filled in." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
        [alert show];
    } else {
        NSNumber *num = [NSNumber numberWithDouble:[self.amountTextField.text doubleValue]];
        PFObject *bill = [PFObject objectWithClassName:@"bill"];
        [bill setObject:[PFUser currentUser].username forKey:@"username"];
        [bill setObject:self.itemTextField.text forKey:@"item"];
        [bill setObject:self.descriptionTextField.text forKey:@"description"];
        [bill setObject:num forKey:@"amount"];
        [bill saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bill Posted" message:nil delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
                    [alert show];
            }
        }];
    }
    
    
}

#pragma mark - UITextfielddelegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
