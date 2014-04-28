//
//  gcChangeStatusViewController.h
//  bizzi
//
//  Created by Garrett Cox on 3/20/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface gcChangeStatusViewController : UIViewController

- (IBAction)changeToFree:(id)sender;

- (IBAction)changeToBusy:(id)sender;

- (IBAction)changeToDontDisturb:(id)sender;

- (IBAction)changeToInMeeting:(id)sender;

- (IBAction)changeToOutForLunch:(id)sender;


@end
