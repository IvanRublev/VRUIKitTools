//
//  VRTouchableView.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 6/18/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRTouchableView;
@protocol VRTouchableViewDelegate <NSObject>
- (void)touchableViewWasTouched:(VRTouchableView*)view;
@end

/**
 *  View class informs delegate when it's touched. Usefull to make view that should disappear on touch
 */
@interface VRTouchableView : UIView
@property (nonatomic, weak) id<VRTouchableViewDelegate> delegate;
@end
