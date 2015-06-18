//
//  VRTouchableView.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 6/18/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRTouchableView.h"

@implementation VRTouchableView

- (void)setDelegate:(id<VRTouchableViewDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(touchableViewWasTouched:)]) {
        _delegate = delegate;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    if (event.type == UIEventTypeTouches) {
        [self.delegate touchableViewWasTouched:self];
        return self;
    }
    return [super hitTest:point withEvent:event];
}

@end
