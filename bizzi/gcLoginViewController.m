//
//  gcLoginViewController.m
//  bizzi
//
//  Created by Garrett Cox on 4/21/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import "gcLoginViewController.h"
#import <Parse/Parse.h>




@interface gcLoginViewController ()

@property (nonatomic, strong) KeyboardController *keyboardController;

@end



@implementation gcLoginViewController : UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _setupTextFields];

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setHidden:YES];
    
    

    
}

- (void) _setupTextFields {
    id fields = @[_usernameField,_passwordField];
    self.keyboardController = [KeyboardController controllerWithFields:fields];
    self.keyboardController.delegate = self;
    self.keyboardController.textFieldDelegate = self;

    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
   
    if (textField == self.passwordField) [self _moveViewByY:-50];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    if (textField == self.passwordField) [self _moveViewByY:50];
    
}

- (void)controllerDidHideKeyboard:(KeyboardController *)controller {
    
}

- (void)controllerDidShowKeyboard:(KeyboardController *)controller {
    
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



- (IBAction)login:(id)sender {
    
        
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
   
    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (error) {
                                                //login Failed
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                    [alertView show];
                                                
                                                
                                            
                                            } else {
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                                // The login failed. Check error to see why.
                                            }
                                        }];
    }
    
    
}



@end
