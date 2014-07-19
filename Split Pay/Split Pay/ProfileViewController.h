//
//  ProfileViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *profilePicture;
@property(strong,nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) UIImage *pic;
@property (strong, nonatomic) IBOutlet UITableView *recentActivityTableView;
@property (strong, nonatomic) NSMutableArray *transactions;

- (IBAction)profilePicButtonPressed:(UIButton *)sender;
@end
