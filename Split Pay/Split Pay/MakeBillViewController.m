//
//  MakeBillViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "MakeBillViewController.h"

@interface MakeBillViewController ()<UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@end

@implementation MakeBillViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];

    self.friends = [[NSMutableArray alloc] init];
    
    self.amountTextField.delegate = self;
    self.itemTextField.delegate = self;
    self.descriptionTextField.delegate = self;
    self.tokenTextField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (IBAction)makeBillButtonPressed:(UIButton *)sender {
    if (self.itemTextField.text.length == 0 || self.amountTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please make sure all fields are filled in." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
        [alert show];
    } else {
        NSNumber *num = [NSNumber numberWithDouble:[self.amountTextField.text doubleValue]];
        PFObject *bill = [PFObject objectWithClassName:@"bill"];
        [bill setObject:[PFUser currentUser].username forKey:@"username"];
        [bill setObject:self.itemTextField.text forKey:@"item"];
        [bill setObject:self.descriptionTextField.text forKey:@"description"];
        [bill setObject:num forKey:@"amount"];
        [bill saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bill Posted" message:nil delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
                    [alert show];
            }
        }];
    }
    
    
}

- (IBAction)addFriendButtonPressed:(UIButton *)sender {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Add Friend" message:@"Please enter the email address of the friend you wish to add." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    UITextField* textfield = [alert textFieldAtIndex:0];
    textfield.placeholder = @"Email address";
    textfield.delegate = self;
    [alert show];
    
}

#pragma mark - AlertView Delegates

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        [self.friends addObject:[[alertView textFieldAtIndex:0] text]];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = self.friends[indexPath.row];
    
    return cell;
}


#pragma mark - UITextfielddelegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(void)dismissKeyboard {
    [self.itemTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.tokenTextField resignFirstResponder];

}
@end
