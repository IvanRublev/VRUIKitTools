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
    [self setNeedsDisplay];
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    CGRect rect = [super backgroundRectForBounds:bounds];
    //insetsRect x=top, y=left, width=bottom, height=right
    rect = CGRectMake(rect.origin.x+self.insetsRect.origin.y,
                      rect.origin.y+self.insetsRect.origin.x,
                      rect.size.width-(self.insetsRect.origin.y+self.insetsRect.size.height),
                      rect.size.height-(self.insetsRect.origin.x+self.insetsRect.size.width));
    if (rect.size.width<0.) {
        rect.size.width = 0.;
    }
    if (rect.size.height<0.) {
        rect.size.height = 0.;
    }
    return rect;
}

@end
