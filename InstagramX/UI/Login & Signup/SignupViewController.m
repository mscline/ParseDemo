//
//  LoginViewController.m
//  InstagramX
//
//  Created by xcode on 6/18/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>
#import "Alert.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tintColor = UIColor.whiteColor;
    [self.userNameTextField becomeFirstResponder];
}

- (IBAction)onSignUpButtonPressed:(id)sender {

    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *email = self.emailTextField.text;

    if (userName.length == 0 || password.length == 0 || email.length == 0) { return; }

    PFUser *newUser = [PFUser new];
    newUser.username = userName;
    newUser.password = password;
    newUser.email = email;

    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {

        if (succeeded && error == nil) {
            [self performSegueWithIdentifier:@"DidSignUp" sender:nil];
            NSLog(@"User signed up.");
        } else {
            if (error.code == 202) {
                [Alert presentAlertWithTitle:@"User name taken." fromViewController:self];
            }
            if (error.code == 125) {
                [Alert presentAlertWithTitle:@"Email address format is invalid." fromViewController:self];
            }
            NSLog(@"%ld: %@", error.code, error.localizedDescription);
        }
    }];
}

@end
