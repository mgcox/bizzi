//
//  gcLoginViewController.m
//  bizzi
//
//  Created by Garrett Cox on 4/21/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "KeyboardController.h"


@interface gcLoginViewController : UIViewController <
KeyboardControllerDelegate,
UITextFieldDelegate
>




@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


- (IBAction)login:(id)sender;

@end
