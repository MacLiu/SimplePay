//
//  ViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//tes

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toFTGsignup" sender:self];
}

- (IBAction)googleButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toFTGsignup" sender:self];

}

- (IBAction)twitterButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toFTGsignup" sender:self];

}

- (IBAction)signUpButtonPressed:(UIButton *)sender {
}
@end
