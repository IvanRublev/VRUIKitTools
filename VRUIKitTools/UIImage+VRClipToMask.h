//
//  UIImage+VRClipToMask.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/22/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIImage receiver is used as grayscale mask clipping to specified foreground color. Background will be filled with background color.
 */
@interface UIImage (VRClipToMask)
- (UIImage*)imageByClippingMaskWithColor:(UIColor*)fillColor;
- (UIImage*)imageByClippingMaskWithColor:(UIColor*)fillColor backgroundColor:(UIColor*)backgroundColor;
@end
