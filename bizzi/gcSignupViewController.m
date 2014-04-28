//
//  gcLoginViewController.m
//  bizzi
//
//  Created by Garrett Cox on 4/21/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import "gcSignupViewController.h"

#import <Parse/Parse.h>

@interface gcSignupViewController ()

@property (nonatomic, strong) KeyboardController *keyboardController;

@end

@implementation gcSignupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _setupTextFields];
	// Do any additional setup after loading the view.
}

- (void)_setupTextFields {
    id fields = @[_firstNameField,_lastNameField,_emailField,_usernameField, _passwordField];
    self.keyboardController = [KeyboardController controllerWithFields:fields];
    self.keyboardController.delegate = self;
    self.keyboardController.textFieldDelegate = self;
}

- (CGFloat)keyboardShiftValue {
    return 0;
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.emailField) [self _moveViewByY:-50];
    if (textField == self.passwordField) [self _moveViewByY:-200];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.emailField) [self _moveViewByY:50];
    if (textField == self.passwordField) [self _moveViewByY:200];
    
}

- (void)moveToNextField:(UITextField *)textField{
   
}

#pragma mark - KeyboardControllerDelegate Methods




- (void)controllerDidHideKeyboard:(KeyboardController *)controller {
    self.keyboardController.delegate = self;
    NSLog(@"IT went here");
}

- (void)controllerDidShowKeyboard:(KeyboardController *)controller {
    self.keyboardController.delegate = self;
}

- (void)controllerWillHideKeyboard:(KeyboardController *)controller {
    [self _moveViewByY:[self keyboardShiftValue]];
}

- (void)controllerWillShowKeyboard:(KeyboardController *)controller {
    [self _moveViewByY:-[self keyboardShiftValue]];
}

- (void)_moveViewByY:(CGFloat)dy {
    NSTimeInterval animationDuration = 0.2f;
    [self _moveView:self.view byY:dy withAnimationDuration:animationDuration];
}

- (void)_moveView:(UIView *)view byY:(CGFloat)dy withAnimationDuration:(NSTimeInterval)duration {
    __block UIView *blockSafeView = view;
    [UIView animateWithDuration:duration animations:^(void){
        blockSafeView.frame = CGRectOffset(blockSafeView.frame, 0, dy);
    }];
}

#pragma mark original code

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signup:(id)sender {
 
   NSString *First = [self.firstNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

   NSString *Last = [self.lastNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

   
    if ([username length] == 0 || [password length] == 0 || [email length] == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password and email address!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else {
        PFUser *newUser = [PFUser user];
        
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        
        newUser[@"phone"] = @"415-392-0202";
        newUser[@"First"] = First;
        newUser[@"Last"] = Last;
        newUser[@"userStatus"] = @"empty";
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
                // Show the errorString somewhere and let the user try again.
            }
        }];
        
        
        
    }

    
}



@end
