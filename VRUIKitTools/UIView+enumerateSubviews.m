//
//  UIView+enumerateSubviews.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 7/28/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIView+enumerateSubviews.h"

@implementation UIView (enumerateSubviews)

- (void)enumerateSubviews:(void (^)(UIView*))block recursively:(BOOL)recursively {
    NSParameterAssert(block);
    [self.subviews enumerateObjectsUsingBlock:^(UIView* subview, NSUInteger idx, BOOL *stop) {
        block(subview);
        if (recursively) {
            [subview enumerateSubviews:block recursively:recursively];
        }
    }];
}

@end
