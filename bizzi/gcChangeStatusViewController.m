//
//  gcChangeStatusViewController.m
//  bizzi
//
//  Created by Garrett Cox on 3/20/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import "gcChangeStatusViewController.h"



@interface gcChangeStatusViewController ()

@end

@implementation gcChangeStatusViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setHidden:NO];
    
    
    
    
}


- (IBAction)changeToFree:(id)sender {
    
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser[@"Last"]);
        currentUser[@"userStatus"] = @"imFree";
    }
    
   // PFUser *user = [PFUser currentUser];
    
    NSLog(@"Button Pressed");
    // other fields can be set just like with PFObject
   // currentUser[@"userStatus"] = @"Hello";
    [currentUser saveInBackground];
    
  
}

- (IBAction)changeToBusy:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser[@"Last"]);
        currentUser[@"userStatus"] = @"busy";
    }
    [currentUser saveInBackground];

}

- (IBAction)changeToDontDisturb:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser[@"Last"]);
        currentUser[@"userStatus"] = @"busyDontDisturb";
    }
    [currentUser saveInBackground];

}

- (IBAction)changeToInMeeting:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser[@"Last"]);
        currentUser[@"userStatus"] = @"inAMeeting";
    }
    [currentUser saveInBackground];

}

- (IBAction)changeToOutForLunch:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser[@"Last"]);
        currentUser[@"userStatus"] = @"outForLunch";
    }
    [currentUser saveInBackground];

}


@end
