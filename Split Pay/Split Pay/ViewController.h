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
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

//IBActions
- (IBAction)facebookButtonPressed:(UIButton *)sender;
- (IBAction)signUpButtonPressed:(UIButton *)sender;
- (IBAction)loginButtonPressed:(UIButton *)sender;

@end
