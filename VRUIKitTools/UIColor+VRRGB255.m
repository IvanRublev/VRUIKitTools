//
//  UIColor+VRRGB255.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 9/3/12.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIColor+VRRGB255.h"

@implementation UIColor (VRRGB255)

+ (UIColor *)colorWithR:(NSUInteger)r G:(NSUInteger)g B:(NSUInteger)b A:(NSUInteger)alpha 
{
    return [UIColor colorWithRed:(float)r/255.f green:(float)g/255.f blue:(float)b/255.f alpha:(float)alpha/255.f];
}

@end
