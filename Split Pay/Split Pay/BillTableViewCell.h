//
//  BillTableViewCell.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol launchPaymentView <NSObject>
-(void)loadNewScreen:(UIViewController *) controller;
@end




@interface BillTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UILabel *amount;
@property (strong, nonatomic) IBOutlet UILabel *item;

- (IBAction)makePaymentButtonPressed:(UIButton *)sender;

@property (nonatomic, retain) id<launchPaymentView> delegate;

@end
