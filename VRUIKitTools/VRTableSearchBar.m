//
//  VRTableSearchBar.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 6/17/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRTableSearchBar.h"

@interface VRTableSearchBar () <UISearchBarDelegate> {
    NSUInteger _fadeViewTransitionsCount;
}
@property (nonatomic, weak) id<UISearchBarDelegate> realDelegate;
@property (nonatomic, readwrite) UIView* fadeView;
@property (nonatomic, assign) BOOL fadeViewVisible;
@property (nonatomic, assign) BOOL wasCanceled;
@end

@implementation VRTableSearchBar
#pragma mark -
#pragma mark Initialization
- (id)initWithCoder:(NSCoder*)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [super setDelegate:self];
}


#pragma mark -
#pragma mark Search Bar Delegate
#pragma mark Setup external delegates
- (void)setDelegate:(id<UISearchBarDelegate>)delegate {
    self.realDelegate = delegate;
}

- (id<UISearchBarDelegate>)delegate {
    return self.realDelegate;
}

#pragma mark Buttons
- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar {
    if (self.shouldResignFirstResponderOnSearchButtonPressed) {
        [self resignFirstResponder];
    }
    if ([self.realDelegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]) {
        [self.realDelegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar*)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]) {
        [self.realDelegate searchBarCancelButtonClicked:searchBar];
    }
    self.wasCanceled = YES;
    if ([self isFirstResponder]) {
        [self resignFirstResponder];
    } else { // is not first responder
        [self setActive:NO animated:YES];
    }
}

#pragma mark Editing text
- (BOOL)searchBarShouldBeginEditing:(UISearchBar*)searchBar {
    BOOL shouldBeginEditing = YES;
    if ([self.realDelegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]) {
        shouldBeginEditing = [self.realDelegate searchBarShouldBeginEditing:searchBar];
    }
    if (shouldBeginEditing) {
        [self setActive:YES animated:YES];
    }
    return shouldBeginEditing;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar {
    self.wasCanceled = NO;
    if ([self.realDelegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]) {
        [self.realDelegate searchBarTextDidBeginEditing:self];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar*)searchBar {
    BOOL shouldEndEditing = YES;
    if ([self.realDelegate respondsToSelector:@selector(searchBarShouldEndEditing:)]) {
        shouldEndEditing = [self.realDelegate searchBarShouldEndEditing:self];
    }
    if (shouldEndEditing && self.wasCanceled) {
        [self setActive:NO animated:YES];
    }
    return shouldEndEditing;
}

- (void)searchBarTextDidEndEditing:(UISearchBar*)searchBar {
    if ([self.realDelegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]) {
        [self.realDelegate searchBarTextDidEndEditing:self];
    }
    if (self.addCancelButtonOnEditing) {
        // Make cancel button always enabled
        dispatch_async(dispatch_get_main_queue(), ^{
            for (UIView* view in searchBar.subviews)
            {
                for (id subview in view.subviews)
                {
                    if ([subview isKindOfClass:[UIButton class]])
                    {
                        [subview setEnabled:YES];
                    }
                }
            }
        });
    }
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText {
    BOOL shouldChangeFade = NO;
    BOOL fadeVisible = NO;
    if (self.fadeViewVisible && searchText.length) {
        shouldChangeFade = YES;
        fadeVisible = NO;
    } else if (!searchText.length && self.addFadeViewWhenTextIsEmpty) {
        shouldChangeFade = YES;
        fadeVisible = YES;
    }
    if (shouldChangeFade) {
        [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
            [self setFadeViewVisible:fadeVisible animated:YES];
        }];
    }
    if ([self.realDelegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
        [self.realDelegate searchBar:self textDidChange:searchText];
    }
}


#pragma mark -
#pragma mark Active
- (void)setActive:(BOOL)active {
    [self setActive:active animated:NO];
}

- (void)setActive:(BOOL)active animated:(BOOL)animated {
    if (!active) {
        self.wasCanceled = NO;
    }
    if (_active != active) {
        _active = active;
        
        // Obtain alongside animation from delegate
        VRTableSearchBarAnimationBlock alongsideAnimation = nil;
        if (active) {
            if ([self.tableSearchBarDelegate respondsToSelector:@selector(tableSearchBarWillBecomeActive:animated:)]) {
                alongsideAnimation = [self.tableSearchBarDelegate tableSearchBarWillBecomeActive:self animated:animated];
            }
        } else { // deactivation
            if ([self.tableSearchBarDelegate respondsToSelector:@selector(tableSearchBarWillResignActive:animated:)]) {
                alongsideAnimation = [self.tableSearchBarDelegate tableSearchBarWillResignActive:self animated:animated];
            }
        }
        // Prepeare self animations
        void (^activate)(void) = ^{
            if (self.addFadeViewWhenTextIsEmpty && !self.text.length) {
                [self setFadeViewVisible:YES animated:animated];
            }
            if (self.addCancelButtonOnEditing) {
                [self setShowsCancelButton:YES animated:animated];
            }
        };
        void (^deactivate)(void) = ^{
            [self setFadeViewVisible:NO animated:animated];
            [self setShowsCancelButton:NO animated:animated];
            if (!self.shouldKeepTextOnCancelButtonPressed) {
                self.text = nil;
            }
        };
        // Union animations
        void (^action)(void) = ^{
            if (active) {
                activate();
            } else {
                deactivate();
            }
            if (alongsideAnimation) {
                alongsideAnimation();
            }
        };
        
        if (animated) {
            [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
                action();
            }];
        } else {
            action();
        }
    }
}


#pragma mark -
#pragma mark Fade view
- (UIView*)fadeView {
    if (!_fadeView && self.superview) {
        _fadeView = [[UIView alloc] initWithFrame:self.superview.bounds];
        _fadeView.backgroundColor = [UIColor blackColor];
        _fadeView.alpha = 1.0;
    }
    return _fadeView;
}

- (void)setFadeViewVisible:(BOOL)fadeViewVisible {
    [self setFadeViewVisible:fadeViewVisible animated:NO];
}

- (void)setFadeViewVisible:(BOOL)fadeViewVisible animated:(BOOL)animated {
    if (_fadeViewVisible != fadeViewVisible) {
        _fadeViewVisible = fadeViewVisible;
        
        void (^preamble)(void) = ^{
            if (self.superview) {
                [self.superview insertSubview:self.fadeView belowSubview:self];
                self.fadeView.alpha = 0.0;
            } else { // have no superview, can't add
                _fadeViewVisible = NO;
                return;
            }
        };
        void (^postamble)(void) = ^{
            [self.fadeView removeFromSuperview];
            self.fadeView = nil;
        };
        // Process unanimated change
        if (!animated) {
            if (fadeViewVisible) { // show
                preamble();
            } else { // not fadeViewVisible, hide
                postamble();
            }
            return;
        }
        // Apply animation
        if (_fadeViewTransitionsCount == 0 && fadeViewVisible) { // preamble
            preamble();
        }
        [UIView animateWithDuration:0 animations:^{
            if (fadeViewVisible) {
                self.fadeView.alpha = 0.3;
            } else { // not fadeViewVisible
                self.fadeView.alpha = 0.0;
            }
        } completion:^(BOOL finished) {
            _fadeViewTransitionsCount--;
            if (_fadeViewTransitionsCount == 0 && !self.fadeViewVisible) { // postamble
                postamble();
            }
        }];
        _fadeViewTransitionsCount++;
    }
}

@end
