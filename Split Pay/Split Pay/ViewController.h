//
//  ViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//IBOutlets
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

//IBActions
- (IBAction)facebookButtonPressed:(UIButton *)sender;
- (IBAction)googleButtonPressed:(UIButton *)sender;
- (IBAction)twitterButtonPressed:(UIButton *)sender;
- (IBAction)signUpButtonPressed:(UIButton *)sender;

@end
