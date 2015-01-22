//
//  UIImage+VRClipToMask.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/22/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIImage+VRClipToMask.h"

@implementation UIImage (VRClipToMask)
- (UIImage *)imageByClippingMaskWithColor:(UIColor*)fillColor
{
    return [self imageByClippingMaskWithColor:fillColor backgroundColor:nil];
}

- (UIImage *)imageByClippingMaskWithColor:(UIColor*)fillColor backgroundColor:(UIColor*)backgroundColor
{
    if (!self.CGImage) {
        return nil;
    }
    if (!backgroundColor) {
        backgroundColor = [UIColor clearColor];
    }
    CGImageRef maskRef = self.CGImage;
    size_t width = CGImageGetWidth(maskRef);
    size_t height = CGImageGetHeight(maskRef);
    CGRect maskRectPoints = CGRectMake(0, 0, width/self.scale, height/self.scale);
    
    UIGraphicsBeginImageContextWithOptions(maskRectPoints.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Flip context vertically
    CGContextTranslateCTM(context, 0.0, maskRectPoints.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    // Fill background
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, maskRectPoints);
    // Apply mask
    CGImageRef maskImageRef = CGImageMaskCreate(width, height,
                                                CGImageGetBitsPerComponent(maskRef),
                                                CGImageGetBitsPerPixel(maskRef),
                                                CGImageGetBytesPerRow(maskRef),
                                                CGImageGetDataProvider(maskRef),
                                                NULL,
                                                false);
    CGContextClipToMask(context, maskRectPoints, maskImageRef);
    CGImageRelease(maskImageRef);
    // Fill foreground
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextFillRect(context, maskRectPoints);
    
    UIImage* composedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIImage* orientedImage = [UIImage imageWithCGImage:composedImage.CGImage scale:self.scale orientation:self.imageOrientation];
    return orientedImage;
}
@end
