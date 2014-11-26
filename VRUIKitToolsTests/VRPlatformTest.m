//
//  VRPlatformTest.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/26/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VRPlatform.h"

@interface VRPlatformTest : XCTestCase

@end

@implementation VRPlatformTest

- (void)testIS_IOSx_OR_LATER {
#undef DEVICE_IOS_VERSION
    __block double testVer = 0.0;
#define DEVICE_IOS_VERSION testVer
 
    [@{@7.0 : ^ BOOL{ return IS_IOS7_OR_LATER; },
       @8.0 : ^ BOOL{ return IS_IOS8_OR_LATER; }}
     enumerateKeysAndObjectsUsingBlock:^(NSNumber *baseMajorVersionNumber, BOOL (^macroToTest)(void), BOOL *stop) {

        double baseMajorVersion = [baseMajorVersionNumber doubleValue];
        for (testVer = baseMajorVersion-0.11; testVer < baseMajorVersion; testVer+=FLT_EPSILON) {
            XCTAssertFalse(macroToTest(), @"%f must not be greater then %.3f", testVer, baseMajorVersion);
        }
        testVer = baseMajorVersion;
        XCTAssertTrue(macroToTest(), @"%f must be greater then %.3f", testVer, baseMajorVersion);
        testVer = baseMajorVersion+0.01;
        XCTAssertTrue(macroToTest(), @"%f must be greater then %.3f", testVer, baseMajorVersion);
        testVer = baseMajorVersion+1.0; // next major version
        XCTAssertTrue(macroToTest(), @"%f must be greater then %.3f", testVer, baseMajorVersion);

    }];
}

@end
