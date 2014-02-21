//
//  UIView+VRFindFirstResponder.m
//  VRUIKitTools
//
//  Added to library by Ivan Rublev on 1/28/13.
//  Copyright (c) 2009 Thomas Müller.
//

#import "UIView+VRFindFirstResponder.h"

@implementation UIView (VRFindFirstResponder)
- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    return nil;
}
@end
