//
//  UIColor+VRRGB255.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 9/3/12.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VRColorRGBA(r, g, b, a) [UIColor colorWithR:r G:g B:b A:a]
#define VRColorRGB(r, g, b) VRColorRGBA(r, g, b, 255)

@interface UIColor (VRRGB255)
+ (UIColor *)colorWithR:(NSUInteger)r G:(NSUInteger)g B:(NSUInteger)b A:(NSUInteger)alpha;
@end
