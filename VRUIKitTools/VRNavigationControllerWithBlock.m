//
//  VRNavigationControllerWithBlock.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/8/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRNavigationControllerWithBlock.h"
#import <objc/runtime.h>

@interface VRNavigationControllerWithBlock () <UINavigationControllerDelegate>

@end

@implementation VRNavigationControllerWithBlock
#define VRNavigationControllerWithBlockWillShowName "VRNavigationControllerWithBlockWillShowName"
#define VRNavigationControllerWithBlockDidShowName "VRNavigationControllerWithBlockDidShowName"

- (void)assignDelegate
{
    if ([self viewControllerWillShowBlock] || [self viewControllerDidShowBlock]) {
        self.delegate = self;
    } else {
        self.delegate = nil;
    }
}

- (void)setViewControllerWillShowBlock:(VRNavigationControllerViewControllerShowBlock)viewControllerWillShowBlock
{
    objc_setAssociatedObject(self, VRNavigationControllerWithBlockWillShowName, [viewControllerWillShowBlock copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self assignDelegate];
}

- (VRNavigationControllerViewControllerShowBlock)viewControllerWillShowBlock
{
    VRNavigationControllerViewControllerShowBlock block = objc_getAssociatedObject(self, VRNavigationControllerWithBlockWillShowName);
    return block;
}

- (void)setViewControllerDidShowBlock:(VRNavigationControllerViewControllerShowBlock)viewControllerDidShowBlock
{
    objc_setAssociatedObject(self, VRNavigationControllerWithBlockDidShowName, [viewControllerDidShowBlock copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self assignDelegate];
}

- (VRNavigationControllerViewControllerShowBlock)viewControllerDidShowBlock
{
    VRNavigationControllerViewControllerShowBlock block = objc_getAssociatedObject(self, VRNavigationControllerWithBlockDidShowName);
    return block;
}

- (void)dealloc
{
    objc_setAssociatedObject(self, VRNavigationControllerWithBlockWillShowName, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, VRNavigationControllerWithBlockDidShowName, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"vrnavcwithblock=E=");
}

#pragma mark -
#pragma mark UINavigation Controller delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController isKindOfClass:[VRNavigationControllerWithBlock class]]) {
        VRNavigationControllerViewControllerShowBlock block = [self viewControllerWillShowBlock];
        if (block) {
            block(navigationController, viewController, animated);
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController isKindOfClass:[VRNavigationControllerWithBlock class]]) {
        VRNavigationControllerViewControllerShowBlock block = [self viewControllerDidShowBlock];
        if (block) {
            block(navigationController, viewController, animated);
        }
    }
}

@end
