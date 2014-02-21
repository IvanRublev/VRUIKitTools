//
//  UIViewController+VRShortcutsToAppDelegateAndBackButton.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/25/13.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/* Please define VRAppDelegateClassName with class name of your current app delegate before including this header.
 */

#ifndef VRAppDelegateClassName
#define VRAppDelegateClassName NSObject
#endif

@interface UIViewController (VRShortcutsToAppDelegateAndBackButton)
- (VRAppDelegateClassName *)appDelegate;
- (UIBarButtonItem *)backButtonOfLowerViewController;
@end
