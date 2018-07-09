//
//  Alert.m
//  InstagramX
//
//  Created by xcode on 6/19/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "Alert.h"

@implementation Alert

+(void)presentAlertWithTitle:(NSString *)title fromViewController:(UIViewController *)parentViewController {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction: [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    [parentViewController presentViewController:alert animated:YES completion:nil];
}

@end
