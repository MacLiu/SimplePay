//
//  MakeBillViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeBillViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *itemTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *tokenTextField;

@property(strong,nonatomic) NSMutableArray *friends;


- (IBAction)makeBillButtonPressed:(UIButton *)sender;
- (IBAction)addFriendButtonPressed:(UIButton *)sender;
@end
