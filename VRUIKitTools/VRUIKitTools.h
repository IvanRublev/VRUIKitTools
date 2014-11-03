//
//  VRUIKitTools.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 2/21/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* UIViewController+VRShortcutsToAppDelegateAndBackButton.c must be compiled in your project to adapt your appDelegate class.
 * To enable the shortcut to app delegate UIViewController category you must do following:
 * Drag above .c and .h file to your xcode project.
 * Add following lines to your YourProject-Prefix.pch
 * #import YourAppDelegate.h
 * #define VRAppDelegateClassName YourAppDelegate
 * #import UIViewController+VRShortcutsToAppDelegateAndBackButton.h
 * #import YourViewController.h - where in you will use shortcut.
 * ...
 */

#import "VRGeometryTools.h"
#import "UIColor+VRRGB255.h"
#import "NSLayoutConstraint+VRTools.h"
#import "UIButton+VRCopy.h"
#import "VRActionSheetWithBlock.h"
#import "VRAlertViewWithBlock.h"
#import "VRNavigationControllerWithBlock.h"
#import "UIImage+VRDerivatives.h"
#import "UIStoryboardSegue+VRDeepDestination.h"
#import "UIView+VRFindFirstResponder.h"
#import "UINavigationController+VRDropdownMenu.h"

#import "VRImageTiledView.h"
#import "VRInsetedBgImageButton.h"
#import "VRButtonsGroup.h"
#import "VRInsettedLabel.h"
#import "VRNavigationBar.h"
#import "VRSegmentedControlWithTags.h"