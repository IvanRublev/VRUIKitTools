//
//  VRInsettedLabel.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 8/20/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRInsettedLabel.h"

@implementation VRInsettedLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets =
    {
        (CGFloat)[self.top doubleValue],
        (CGFloat)[self.left doubleValue],
        (CGFloat)[self.bottom doubleValue],
        (CGFloat)[self.right doubleValue]
    };
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
