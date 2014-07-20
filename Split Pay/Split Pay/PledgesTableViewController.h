//
//  PledgesTableViewController.h
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PledgesTableViewController : UITableViewController

@property(strong,nonatomic) NSArray *pledges;
@property (strong,nonatomic) NSMutableArray *searchedNames;
@property (nonatomic)BOOL isFiltered;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBat;
@end
