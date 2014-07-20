//
//  BillingViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillingViewController : UIViewController

//IBOutlets
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creditCardNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *cardTypeTextField;
@property (strong, nonatomic) IBOutlet UITextField *expDateMonthTextField;
@property (strong, nonatomic) IBOutlet UITextField *expDateYearTextField;
@property (strong, nonatomic) IBOutlet UITextField *cvv2TextField;
@property (strong, nonatomic) IBOutlet UITextField *adressTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipTextField;


- (IBAction)finishButtonPressed:(UIButton *)sender;


@end
