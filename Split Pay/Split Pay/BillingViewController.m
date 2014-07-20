//
//  BillingViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "BillingViewController.h"
#import <Simplify/SIMChargeCardViewController.h>
#import <Simplify/SIMButton.h>
#import <Simplify/UIImage+Simplify.h>
#import <Simplify/UIColor+Simplify.h>
#import <Simplify/SIMResponseViewController.h>

@interface BillingViewController ()<UITextFieldDelegate, SIMChargeCardViewControllerDelegate, UIImagePickerControllerDelegate>

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
    NSLog(@"before view controller");
    //2. Create a SIMChargeViewController with your public api key
    SIMChargeCardViewController *chargeVC = [[SIMChargeCardViewController alloc] initWithPublicKey:@"sbpb_MjkzZGU2N2UtOWEzZS00NzFmLWFiN2EtMzQ3ZThjZWRlNmJi" primaryColor:[UIColor redColor]];
    //3. Assign your class as the delegate to the SIMChargeViewController class which takes the user input and requests a token
    chargeVC.delegate = self;
    
    //4. Add SIMChargeViewController to your view hierarchy
    [self presentViewController:chargeVC animated:YES completion:nil];
    
    UIImagePickerController *c = [[UIImagePickerController alloc] init];
    c.delegate = self;
    [self presentViewController:c animated:NO completion:nil];
    NSLog(@"after view controller");

}

#pragma mark - UITextfielddelegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)finishButtonPressed:(UIButton *)sender {
    if (self.cardTypeTextField.text.length == 0 || self.creditCardNumberTextField.text.length == 0 || self.expDateMonthTextField.text.length == 0 || self.expDateYearTextField.text.length == 0 ||self.cvv2TextField.text.length == 0|| self.adressTextField.text.length == 0 || self.cityTextField.text.length == 0 ||self.stateTextField.text.length == 0 || self.zipTextField.text.length == 0 || self.nameTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please make sure all required fields are filled in" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else {
        [self performSegueWithIdentifier:@"billingtoprofile" sender:self];
    }
    
}

#pragma mark - SIMChargeViewControllerDelegate Protocol

-(void)creditCardTokenProcessed:(SIMCreditCardToken *)token {
    
    //Process the provided token
    NSLog(@"Token:%@", token.token);
    [self performSegueWithIdentifier:@"billingtoprofile" sender:self];
}

-(void)chargeCardCancelled {
    
    //User cancelled the SIMChargeCardViewController
    NSLog(@"User Cancelled");
    [self performSegueWithIdentifier:@"billingtoprofile" sender:self];
}

-(void)creditCardTokenFailedWithError:(NSError *)error {
    
    //There was a problem generating the token
    
    NSLog(@"Credit Card Token Failed with error:%@", error.localizedDescription);
    UIImageView *blurredView = [UIImage blurImage:self.view.layer];
    SIMResponseViewController *viewController = [[SIMResponseViewController alloc] initWithBackground:blurredView primaryColor:[UIColor redColor] title:@"Failure." description:@"There was a problem with the payment.\nPlease try again."];
    [self presentViewController:viewController animated:YES completion:nil];
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

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

@end
