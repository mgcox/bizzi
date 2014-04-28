//
//  gcStatusTableViewController.m
//  bizzi
//
//  Created by Garrett Cox on 3/20/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import "gcStatusTableViewController.h"

@interface gcStatusTableViewController ()

@end

@implementation gcStatusTableViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signupBackground"]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the use r
        NSLog(@"Current user: %@", currentUser.username);
        
    } else {
        // show the signup or login screen
        [self performSegueWithIdentifier:@"showLogin" sender:self];
        
    }
    
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            // The find succeeded.
            NSLog(@"Error: %@ %@",error, [error userInfo]);
            
            
        } else {
            
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
    
    self.currentUser = [PFUser currentUser];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username; //this will show the username
   // cell.textLabel.text = user[@"First"];
    
    if ([user[@"userStatus"]  isEqual: @"imFree"]) {
        cell.imageView.image = [UIImage imageNamed:@"Happy_Face"];

    }
    
    if ([user[@"userStatus"]  isEqual: @"busy"]) {
        cell.imageView.image = [UIImage imageNamed:@"busy"];
        
    }
    
    if ([user[@"userStatus"]  isEqual: @"busyDontDisturb"]) {
        cell.imageView.image = [UIImage imageNamed:@"Fencing"];
        
    }
    
    if ([user[@"userStatus"]  isEqual: @"inAMeeting"]) {
        cell.imageView.image = [UIImage imageNamed:@"Office_Chair"];
        
    }
    
    if ([user[@"userStatus"]  isEqual: @"outForLunch"]) {
        cell.imageView.image = [UIImage imageNamed:@"Lunch"];
        
    }
    
    if ([user[@"userStatus"]  isEqual: @"empty"]) {
        cell.imageView.image = [UIImage imageNamed:@"Happy_Face"];
        
    }
    
    
    cell.backgroundColor = [UIColor colorWithRed:0. green:0.39 blue:0.106 alpha:0.];
    //use hashing or more efficent code once this app gets popular
    cell.textLabel.textColor = [UIColor whiteColor];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
   // UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
  //  PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    
    
    
    
    //stores changes
    
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error){
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
    }];
    
    
}

#pragma mark - Helper methods


-(BOOL) isFriend:(PFUser *)user {
    for (PFUser *friend in self.friends) {
        if ([friend.objectId isEqualToString:user.objectId]) {
            return YES;
        }
    }
    return NO;
}


    - (IBAction)logout:(id)sender {
        
        [PFUser logOut];
        
        [self performSegueWithIdentifier:@"showLogin" sender:self];
        
    }
@end
