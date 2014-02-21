//
//  UIButton+VRCopy.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/26/13.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIButton+VRCopy.h"

@implementation UIButton (VRCopy)

- (UIButton *)copy
{
    UIButton *buttonCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
    [buttonCopy setImage:[self imageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [buttonCopy setImage:[self imageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
    [buttonCopy setImage:[self imageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    [buttonCopy setImage:[self imageForState:UIControlStateSelected] forState:UIControlStateSelected];
    
    return buttonCopy;
}

@end
