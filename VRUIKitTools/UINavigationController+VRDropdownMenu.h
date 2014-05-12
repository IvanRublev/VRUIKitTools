//
//  UINavigationController+VRDropdownMenu.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/** This category allows to show specified view controller's view as dropdown menu animated.
 *  Best scenario is to instantenate view controller from storyboard and pass to this category.
 *  After hiding the passed view controller will be released automatically.
 **/

typedef NSArray * (^VRDropdownMenuViewMakeAdditionalConstraintsBlock)(UIView * view);

@interface UINavigationController (VRDropdownMenu)

- (void)showVRDropdownMenuViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)hideVRDropdownMenuAnimated:(BOOL)animated;

- (void)showVRDropdownMenuViewController:(UIViewController *)viewController
                   additionalConstraints:(VRDropdownMenuViewMakeAdditionalConstraintsBlock)additionalConstraintsBlock
                                animated:(BOOL)animated;
- (void)showVRDropdownMenuViewController:(UIViewController *)viewController
                         backgroundColor:(UIColor *)backgroundColor
                   additionalConstraints:(VRDropdownMenuViewMakeAdditionalConstraintsBlock)additionalConstraintsBlock
                                animated:(BOOL)animated;

@end
