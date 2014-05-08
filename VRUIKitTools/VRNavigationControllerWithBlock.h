//
//  VRNavigationControllerWithBlock.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/8/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRNavigationControllerWithBlock;

typedef void(^VRNavigationControllerViewControllerShowBlock)(VRNavigationControllerWithBlock * navigationController, UIViewController * viewController, BOOL animated);

@interface VRNavigationControllerWithBlock : UINavigationController
- (void)setViewControllerWillShowBlock:(VRNavigationControllerViewControllerShowBlock)viewControllerWillShowBlock;
- (VRNavigationControllerViewControllerShowBlock)viewControllerWillShowBlock;
- (void)setViewControllerDidShowBlock:(VRNavigationControllerViewControllerShowBlock)viewControllerDidShowBlock;
- (VRNavigationControllerViewControllerShowBlock)viewControllerDidShowBlock;
@end
