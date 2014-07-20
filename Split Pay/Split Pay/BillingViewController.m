//
//  BillingViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "BillingViewController.h"

@interface BillingViewController ()<UITextFieldDelegate>

@end

@implementation BillingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.nameTextField.delegate = self;
    self.creditCardNumberTextField.delegate = self;
    self.cardTypeTextField.delegate = self;
    self.expDateYearTextField.delegate = self;
    self.expDateMonthTextField.delegate = self;
    self.cvv2TextField.delegate = self;
    self.adressTextField.delegate = self;
    self.cityTextField.delegate = self;
    self.stateTextField.delegate = self;
    self.zipTextField.delegate = self;

    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

#pragma mark - UITextfielddelegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)finishButtonPressed:(UIButton *)sender {
    
}

#pragma mark - Helper Methods

-(void)dismissKeyboard {
    [self.creditCardNumberTextField resignFirstResponder];
    [self.cardTypeTextField resignFirstResponder];
    [self.expDateMonthTextField resignFirstResponder];
    [self.expDateYearTextField resignFirstResponder];
    [self.cvv2TextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.adressTextField resignFirstResponder];
    [self.cityTextField resignFirstResponder];
    [self.stateTextField resignFirstResponder];
    [self.zipTextField resignFirstResponder];
}



@end
