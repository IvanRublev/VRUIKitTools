//
//  VRInsetedBgImageButton.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 4/19/13.
//  Copyright (c) 2013 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRInsetedBgImageButton.h"

@implementation VRInsetedBgImageButton
- (void)setInsetsRect:(CGRect)insetsRect
{
    _insetsRect = insetsRect;
    NSArray * states = @[@(UIControlStateNormal), @(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected)];
    for (NSNumber * state in states) {
        NSUInteger stateConst = [state unsignedIntegerValue];
        UIImage * bgImage = [self backgroundImageForState:stateConst];
        UIImage * inaetedImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(_insetsRect.origin.x, _insetsRect.origin.y, _insetsRect.size.width, _insetsRect.size.height)];
        [self setBackgroundImage:inaetedImage forState:stateConst];
    }
}
@end
