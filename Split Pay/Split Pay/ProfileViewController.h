//
//  ProfileViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *profilePicture;
@property(strong,nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) UIImage *pic;

- (IBAction)profilePicButtonPressed:(UIButton *)sender;
@end
