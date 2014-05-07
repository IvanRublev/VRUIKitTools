//
//  UIStoryboardSegue+VRDeepDestination.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 4/4/13.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIStoryboardSegue+VRDeepDestination.h"

@implementation UIStoryboardSegue (VRDeepDestination)

- (id)deepDestinationViewController
{
    return [self deepViewController:self.destinationViewController];
}

- (id)deepSourceViewController
{
    return [self deepViewController:self.sourceViewController];
}

- (id)deepViewController:(UIViewController *)viewController
{
    if (viewController && [viewController isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController *)viewController).topViewController;
    }
    return viewController;
}

@end
