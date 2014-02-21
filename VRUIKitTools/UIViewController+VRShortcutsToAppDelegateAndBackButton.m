//
//  UIViewController+VRShortcutsToAppDelegateAndBackButton.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/25/13.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIViewController+VRShortcutsToAppDelegateAndBackButton.h"

@implementation UIViewController (VRShortcutsToAppDelegateAndBackButton)

- (VRAppDelegateClassName *)appDelegate
{
    return (VRAppDelegateClassName *)[[UIApplication sharedApplication] delegate];
}

- (UIBarButtonItem *)backButtonOfLowerViewController
{
    if ([self.navigationController.viewControllers count] > 1) {
        return [[[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count] - 2] navigationItem] backBarButtonItem];
    }
    return nil;
}

@end
