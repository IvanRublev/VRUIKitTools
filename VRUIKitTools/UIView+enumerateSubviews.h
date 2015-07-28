//
//  UIView+enumerateSubviews.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 7/28/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (enumerateSubviews)
- (void)enumerateSubviews:(void (^)(UIView* subview))block recursively:(BOOL)recursively;
@end
