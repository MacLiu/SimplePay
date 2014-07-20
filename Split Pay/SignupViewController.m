//
//  SignupViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController () <UITextFieldDelegate>

@end

@implementation SignupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.numberTextField.delegate = self;
    self.firstNameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    self.emailTextField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signupButtonPressed:(UIButton *)sender {
    
    if (self.firstNameTextField.text.length == 0 || self.lastNameTextField.text.length == 0 || self.emailTextField.text.length == 0 || self.passwordTextField.text.length == 0 || self.confirmPasswordTextField.text.length == 0 || self.numberTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please make sure all fields are filled out." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords do not match. Please try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else {
        PFUser *user = [PFUser user];
        user.username = [NSString stringWithFormat:@"%@ %@", self.firstNameTextField.text, self.lastNameTextField.text];
        user[@"firstName"] = self.firstNameTextField.text;
        user[@"lastName"] = self.lastNameTextField.text;
        user.password = self.passwordTextField.text;
        user.email = self.emailTextField.text;

        // other fields can be set if you want to save more information
        user[@"phone"] = self.numberTextField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Hooray! Let them use the app now.
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Thank you for joining Split Pay." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
                [alert show];
                [self performSegueWithIdentifier:@"toLogin" sender:self];
            } else {
                NSString *errorString = [error userInfo][@"error"];
                // Show the errorString somewhere and let the user try again.
            }
        }];
        
    }
}

#pragma mark - UITextfielddelegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(void)dismissKeyboard {
    [self.emailTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.lastNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.confirmPasswordTextField resignFirstResponder];
    [self.numberTextField resignFirstResponder];

}
@end
