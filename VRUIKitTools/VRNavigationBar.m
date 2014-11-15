//
//  VRNavigationBar.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/2/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRNavigationBar.h"
#import "NSLayoutConstraint+VRTools.h"

@interface VRNavigationBar () {
    UIImage * _backgroundPatternImage;
    UIView * _customBackgroundView;
    UIView * _backgroundPatternView;
    NSLayoutConstraint * _backgroundPatternViewHeightConstraint;
}
@end

@implementation VRNavigationBar

#pragma mark -
#pragma mark Place custom background image over background view
- (void)awakeFromNib
{
    [super awakeFromNib];
    _customBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _customBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _customBackgroundView.backgroundColor = [UIColor clearColor];
    _customBackgroundView.userInteractionEnabled = NO;
    // We can't add constraints to navigation bar because it's restricted by SDK.
    // Add wraper custom background view and patternized view to it.
    _backgroundPatternView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundPatternView.translatesAutoresizingMaskIntoConstraints = NO;
    [_customBackgroundView addSubview:_backgroundPatternView];
    
    NSAssert([self.subviews count], @"Can't insert custom background over background subview. No subviews in navigation bar!");
    [self insertSubview:_customBackgroundView atIndex:1];
}

- (void)updateConstraints
{
    CGFloat height = _backgroundPatternImage.size.height;
    if (!_backgroundPatternViewHeightConstraint) {
        NSLayoutConstraint * constraint = nil;
        NSArray * allConstraints = [NSLayoutConstraint constraintsMakeView:_backgroundPatternView withHeight:height edgedToBottomOfSecondView:_customBackgroundView priority:UILayoutPriorityRequired heightConstraint:&constraint];
        [_customBackgroundView addConstraints:allConstraints];
        _backgroundPatternViewHeightConstraint = constraint;
    } else {
        _backgroundPatternViewHeightConstraint.constant = height;
    }
    [super updateConstraints];
}

- (void)setBackgroundPatternImage:(UIImage *)backgroundPatternImage
{
    _backgroundPatternImage = backgroundPatternImage;
    if (!backgroundPatternImage) {
        _backgroundPatternView.backgroundColor = [UIColor clearColor];
    } else {
        UIColor * customBgColor = [UIColor colorWithPatternImage:backgroundPatternImage];
        _backgroundPatternView.backgroundColor = customBgColor;
    }
    [self setNeedsUpdateConstraints];
}

- (UIImage *)backgroundPatternImage
{
    return _backgroundPatternImage;
}


#pragma mark -
#pragma mark Prevent hidden change from SDK
- (void)setHidden:(BOOL)hidden
{
    if (!self.ignoreHiddenChange) {
        [super setHidden:hidden];
    }
}

@end
