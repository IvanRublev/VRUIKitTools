//
//  VRTableSearchBar.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 6/17/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRTableSearchBar;
typedef void(^VRTableSearchBarAnimationBlock)(void);

@protocol VRTableSearchBarDelegate <NSObject>
@optional
- (VRTableSearchBarAnimationBlock)tableSearchBarWillStartEditing:(VRTableSearchBar*)searchBar animated:(BOOL)animated;
- (void)tableSearchBar:(VRTableSearchBar*)searchBar textDidChange:(NSString*)searchText;
- (VRTableSearchBarAnimationBlock)tableSearchBarWillEndEditing:(VRTableSearchBar*)searchBar animated:(BOOL)animated;
@end

@interface VRTableSearchBar : UISearchBar
@property (nonatomic, weak) id<VRTableSearchBarDelegate> tableSearchBarDelegate;
@property (nonatomic, assign) IBInspectable BOOL shouldResignFirstResponderOnSearchButtonPressed;
@property (nonatomic, assign) IBInspectable BOOL addCancelButtonOnEditing;
@property (nonatomic, assign) IBInspectable BOOL shouldKeepTextOnCancelButtonPressed;
@property (nonatomic, assign) IBInspectable BOOL addFadeViewWhenTextIsEmpty;
@property (nonatomic, readwrite) UIColor* fadeViewColor;
@property (nonatomic, assign) BOOL active;
@end
