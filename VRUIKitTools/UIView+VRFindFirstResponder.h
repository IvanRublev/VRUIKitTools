//
//  UIView+FindFirstResponder.h
//  VRUIKitTools
//
//  Added to library by Ivan Rublev on 1/28/13.
//  Copyright (c) 2009 Thomas Müller.
//

#import <UIKit/UIKit.h>

/*
 * Returs self or subview answered positive to .isFirstResponder
 * From here http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api
 */

@interface UIView (VRFindFirstResponder)
- (UIView *)findFirstResponder;
@end
