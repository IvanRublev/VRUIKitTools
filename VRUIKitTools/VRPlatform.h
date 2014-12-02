//
//  VRPlatform.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/26/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEVICE_IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define IS_IOSx_OR_LATER(X) (((double)(DEVICE_IOS_VERSION)-X) >= -((double)(DEVICE_IOS_VERSION)-X)*DBL_EPSILON)
#define IS_IOS7_OR_LATER IS_IOSx_OR_LATER(7.0)
#define IS_IOS8_OR_LATER IS_IOSx_OR_LATER(8.0)
