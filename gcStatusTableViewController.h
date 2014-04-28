//
//  gcStatusTableViewController.h
//  bizzi
//
//  Created by Garrett Cox on 3/20/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface gcStatusTableViewController : UITableViewController


@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;



@property (nonatomic, strong) PFRelation *friendsRelation; //delete this

@property (nonatomic, strong) NSArray *friends; //delete this

- (IBAction)logout:(id)sender;


@end
