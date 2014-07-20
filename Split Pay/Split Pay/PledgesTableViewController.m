//
//  PledgesTableViewController.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "PledgesTableViewController.h"
#import "BillTableViewCell.h"

@interface PledgesTableViewController () <UISearchBarDelegate>

@end

@implementation PledgesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.searchedNames = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"bill"];
    [query orderByAscending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.pledges = objects;
            [self.tableView reloadData];
        }
    }];
    
    self.searchBat.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (self.isFiltered) {
        return self.searchedNames.count;
    }
    return self.pledges.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *pledge;
    
    if (self.isFiltered) {
        pledge = [self.searchedNames objectAtIndex:indexPath.row];
    } else {
        pledge = [self.pledges objectAtIndex:indexPath.row];
    }
   
    NSNumber *amount = [pledge objectForKey:@"amount"];
                        NSString *stringAmount = [NSString stringWithFormat:@"$ %@", amount];
    cell.username.text = [pledge objectForKey:@"username"];
    cell.description.text = [pledge objectForKey:@"description"];
    cell.amount.text = stringAmount;
    cell.item.text = [pledge objectForKey:@"item"];
    
    return cell;
}


#pragma mark - Search Bar Delegates

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.searchedNames removeAllObjects];
    if ([searchText length] == 0) {
        self.isFiltered = NO;
    } else {
        self.isFiltered = YES;
        
        for (PFObject *pledge in self.pledges) {
            NSString *username = pledge[@"username"];
            
            NSRange searchRange = [username rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (searchRange.location != NSNotFound) {
                [self.searchedNames addObject:pledge];
            }
        }
        
    }
    [self.tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.tableView resignFirstResponder];
    [self.searchBat resignFirstResponder];
}

@end
