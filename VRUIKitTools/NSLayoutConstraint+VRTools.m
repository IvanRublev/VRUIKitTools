//
//  NSLayoutConstraint+VRTools.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 5/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "NSLayoutConstraint+VRTools.h"

@implementation NSLayoutConstraint (VRTools)

// From http://stackoverflow.com/a/14173970/2924596
+ (NSArray *)constraintsMakeView:(UIView *)view1 equalToView:(UIView *)view2 priority:(UILayoutPriority)priority {
    NSLayoutConstraint *con1 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *con2 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *con3 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *con4 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    con1.priority = priority;
    con2.priority = priority;
    con3.priority = priority;
    con4.priority = priority;
    NSArray *constraints = @[con1,con2,con3,con4];
    return constraints;
}

+ (NSArray *)constraintsMakeView:(UIView *)view1 equalToView:(UIView *)view2 priority:(UILayoutPriority)priority topConstraint:(out NSLayoutConstraint *__autoreleasing *)topConstraint
{
    NSLayoutConstraint *con1 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *con2 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *con3 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *con4 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSArray *constraints = @[con1,con2,con3,con4];
    con1.priority = priority;
    con2.priority = priority;
    con3.priority = priority;
    con4.priority = priority;
    if (topConstraint) {
        *topConstraint = con1;
    }
    return constraints;
}

+ (NSArray *)constraintsMakeView:(UIView *)view1 withHeight:(CGFloat)height edgedToBottomOfSecondView:(UIView *)view2 priority:(UILayoutPriority)priority heightConstraint:(out NSLayoutConstraint *__autoreleasing *)heightConstraint
{
    NSLayoutConstraint *con1 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    NSLayoutConstraint *con2 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *con3 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *con4 = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSArray *constraints = @[con1,con2,con3,con4];
    con1.priority = priority;
    con2.priority = priority;
    con3.priority = priority;
    con4.priority = priority;
    if (heightConstraint) {
        *heightConstraint = con1;
    }
    return constraints;
    
}

@end
