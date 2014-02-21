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
    if (self.destinationViewController && [self.destinationViewController isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController *)self.destinationViewController).topViewController;
    }
    return self.destinationViewController;
}
@end
