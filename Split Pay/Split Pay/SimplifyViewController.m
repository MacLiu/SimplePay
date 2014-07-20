//
//  SimplifyViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "SimplifyViewController.h"
#import <Simplify/SIMChargeCardViewController.h>

@interface SimplifyViewController () <SIMChargeCardViewControllerDelegate>

@end

@implementation SimplifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //2. Create a SIMChargeViewController with your public api key
    SIMChargeCardViewController *chargeVC = [[SIMChargeCardViewController alloc] initWithPublicKey:@"YOUR_PUBLIC_API_KEY"];
    
    //3. Assign your class as the delegate to the SIMChargeViewController class which takes the user input and requests a token
    chargeVC.delegate = self;
    
    //4. Add SIMChargeViewController to your view hierarchy
    [self presentViewController:chargeVC animated:YES completion:nil];

}

#pragma mark SIMChargeCardViewControllerDelegate callback
//5. This method will be called on your class whenever the user presses the Charge Card button and tokenization succeeds
-(void)creditCardTokenProcessed:(SIMCreditCardToken *)token {
    
    //Process the provided token
    NSLog(@"Token:%@", token.token);
    
}

@end
