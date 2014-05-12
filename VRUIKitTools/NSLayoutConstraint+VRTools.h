//
//  NSLayoutConstraint+VRTools.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (VRTools)
+ (NSArray *)constraintsMakeView:(UIView *)view1 equalToView:(UIView *)view2 priority:(UILayoutPriority)priority;
+ (NSArray *)constraintsMakeView:(UIView *)view1 equalToView:(UIView *)view2 priority:(UILayoutPriority)priority constraintToSlideFromTop:(NSLayoutConstraint *__autoreleasing *)topConstraint;
@end
