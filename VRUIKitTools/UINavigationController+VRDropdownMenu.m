//
//  UINavigationController+VRDropdownMenu.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//  Inspired by https://github.com/bsideup/TLDropDownMenu made by bsideup.
//

#import "UINavigationController+VRDropDownMenu.h"
#import "NSLayoutConstraint+VRTools.h"
#import <objc/runtime.h>

@implementation UINavigationController (VRDropdownMenu)
#define kcVRDropdownMenuDictionary "kcVRDropdownMenuDictionary"
#define kVRDropdownMenuViewController @"kVRDropdownMenuViewController"
#define kVRDropdownMenuViewTopConstraint @"kVRDropdownMenuViewTopConstraint"
#define kVRDropdownMenuBackgroundView @"kVRDropdownMenuBackgroundView"
#define kVRDropdownAnimationDuration 0.25

- (void)showVRDropdownMenuViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self showVRDropdownMenuViewController:viewController backgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5] additionalConstraints:nil animated:animated];
}

- (void)showVRDropdownMenuViewController:(UIViewController *)viewController additionalConstraints:(VRDropdownMenuViewMakeAdditionalConstraintsBlock)additionalConstraintsBlock animated:(BOOL)animated
{
    [self showVRDropdownMenuViewController:viewController backgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5] additionalConstraints:additionalConstraintsBlock animated:animated];
}

- (void)showVRDropdownMenuViewController:(UIViewController *)viewController backgroundColor:(UIColor *)backgroundColor additionalConstraints:(VRDropdownMenuViewMakeAdditionalConstraintsBlock)additionalConstraintsBlock animated:(BOOL)animated
{
    UIViewController * acceptorViewController = self.topViewController;
    UIView * acceptorView = acceptorViewController.view;
    UIView * menuView = viewController.view;
    if (!acceptorView || !viewController || !menuView) {
        NSLog(@"!acceptorView %@ !viewController %@ !menuView %@", acceptorView, viewController, menuView);
        return;
    }
    
    [self hideVRDropdownMenuAnimated:NO];
	UIView *menuBackgroundView = [[UIView alloc] initWithFrame:acceptorView.bounds];
	menuBackgroundView.backgroundColor = backgroundColor;
    
    [viewController removeFromParentViewController];
    [acceptorViewController addChildViewController:viewController];
	[menuBackgroundView addSubview:menuView];
    [menuBackgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [menuView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *topConstraint = nil;
    NSMutableArray * constraintsToMenuView = [NSMutableArray array];
    [constraintsToMenuView addObjectsFromArray:[NSLayoutConstraint constraintsMakeView:menuView equalToView:menuBackgroundView priority:UILayoutPriorityDefaultHigh constraintToSlideFromTop:&topConstraint]];
    if (additionalConstraintsBlock) {
        NSArray * additionalConstraints = additionalConstraintsBlock(menuView);
        if (additionalConstraints) {
            [constraintsToMenuView addObjectsFromArray:additionalConstraints];
        }
    }
    [menuBackgroundView addConstraints:constraintsToMenuView];
	[acceptorView addSubview:menuBackgroundView];
    NSArray *constraints = [NSLayoutConstraint constraintsMakeView:menuBackgroundView equalToView:acceptorView priority:UILayoutPriorityDefaultHigh];
    topConstraint.constant = -acceptorView.bounds.size.height;
    [acceptorView addConstraints:constraints];
    [acceptorView layoutIfNeeded];
    [viewController didMoveToParentViewController:acceptorViewController];
	objc_setAssociatedObject(self,
                             kcVRDropdownMenuDictionary,
                             @{kVRDropdownMenuViewController : viewController,
                               kVRDropdownMenuViewTopConstraint : topConstraint,
                               kVRDropdownMenuBackgroundView : menuBackgroundView },
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
   
	void (^animations) ( void ) = ^{
		menuBackgroundView.alpha = 1.0;
        topConstraint.constant = 0;
        [acceptorView layoutIfNeeded];
	};
    
	if ( animated ) {
		menuBackgroundView.alpha = 0.0;
		[UIView animateWithDuration:kVRDropdownAnimationDuration animations:animations completion:nil];
	} else {
		animations();
	}
}

- (void)hideVRDropdownMenuAnimated:(BOOL)animated
{
    NSDictionary * dictionary = objc_getAssociatedObject(self, kcVRDropdownMenuDictionary);
    objc_setAssociatedObject(self, kcVRDropdownMenuDictionary, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIViewController * menuViewController = dictionary[kVRDropdownMenuViewController];
    UIView * menuBackgroundView = dictionary[kVRDropdownMenuBackgroundView];
    UIView * acceptorView = menuBackgroundView.superview;
    NSLayoutConstraint * topConstraint = dictionary[kVRDropdownMenuViewTopConstraint];
    
    if (!menuViewController || !acceptorView || !menuBackgroundView || !topConstraint) {
        return;
    }
    
    [acceptorView layoutIfNeeded];
	void (^animations) ( void ) = ^
	{
        menuBackgroundView.alpha = 0.0;
        topConstraint.constant = -acceptorView.bounds.size.height;
        [acceptorView layoutIfNeeded];
	};
    
	void (^completion) ( BOOL ) = ^( BOOL completed )
	{
		[menuBackgroundView removeFromSuperview];
        [menuViewController removeFromParentViewController];
	};
    
	if (animated)
	{
		[UIView animateWithDuration:kVRDropdownAnimationDuration animations:animations completion:completion];
	}
	else
	{
		completion(YES);
	}
}

@end
