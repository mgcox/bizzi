//
//  gcLoginViewController.m
//  bizzi
//
//  Created by Garrett Cox on 4/21/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "KeyboardController.h"

@interface gcSignupViewController : UIViewController<KeyboardControllerDelegate,
UITextFieldDelegate
>


@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)dismiss:(id)sender;



- (IBAction)signup:(id)sender;

- (void)closeKeyboard;

@end
