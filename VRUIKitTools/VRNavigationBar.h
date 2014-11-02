//
//  VRNavigationBar.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/2/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VRNavigationBar : UINavigationBar
- (void)setBackgroundPatternImage:(UIImage *)backgroundPatternImage UI_APPEARANCE_SELECTOR;
- (UIImage *)backgroundPatternImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) BOOL ignoreHiddenChange;
@end
