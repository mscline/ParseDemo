//
//  LoginViewController.m
//  InstagramX
//
//  Created by xcode on 6/18/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tintColor = UIColor.whiteColor;
    [self.userNameTextField becomeFirstResponder];
}

- (IBAction)onSignInButtonPressed:(id)sender {

    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;

    [PFUser logInWithUsernameInBackground:userName password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {

        if (error) {
            NSLog(@"%@", error.localizedDescription);

        } else {
            [self performSegueWithIdentifier:@"DidLogin" sender:nil];
        }
    }];
}

@end
