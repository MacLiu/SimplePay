//
//  BillTableViewCell.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "BillTableViewCell.h"
#import <Simplify/SIMChargeCardViewController.h>
#import <Simplify/SIMButton.h>
#import <Simplify/UIImage+Simplify.h>
#import <Simplify/UIColor+Simplify.h>
#import <Simplify/SIMResponseViewController.h>

@implementation BillTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)makePaymentButtonPressed:(UIButton *)sender {
    SIMChargeCardViewController *chargeVC = [[SIMChargeCardViewController alloc] initWithPublicKey:@"sbpb_MjkzZGU2N2UtOWEzZS00NzFmLWFiN2EtMzQ3ZThjZWRlNmJi" primaryColor:[UIColor redColor]];
    //3. Assign your class as the delegate to the SIMChargeViewController class which takes the user input and requests a token
    chargeVC.delegate = self;
    
    //4. Add SIMChargeViewController to your view hierarchy
    [self.delegate loadNewScreen:chargeVC];
}

#pragma mark - SIMChargeViewControllerDelegate Protocol

-(void)creditCardTokenProcessed:(SIMCreditCardToken *)token {
    
    //Process the provided token
    
    NSLog(@"Token:%@", token.token);
    NSURL *url= [NSURL URLWithString:@"http://arcane-ridge-6454.herokuapp.com/charge.php"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"simplifyToken=";
    
    postString = [postString stringByAppendingString:token.token];
    
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSError *error;
    
    if (error) {
        NSLog(@"error:%@", error);
    } else {
        NSLog(@"Payment was successful");
    }
}

-(void)chargeCardCancelled {
    
    //User cancelled the SIMChargeCardViewController
    NSLog(@"User Cancelled");
}

-(void)creditCardTokenFailedWithError:(NSError *)error {
    
    //There was a problem generating the token
    
    NSLog(@"Credit Card Token Failed with error:%@", error.localizedDescription);
}


@end
