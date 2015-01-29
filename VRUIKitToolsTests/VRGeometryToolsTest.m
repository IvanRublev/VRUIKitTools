//
//  VRGeometryToolsTest.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 1/23/15.
//  Copyright (c) 2015 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VRUIKitTools.h"

@interface VRGeometryToolsTest : XCTestCase

@end

@implementation VRGeometryToolsTest

- (void)testPointDistanceToLine {
    // This is an example of a functional test case.
    XCTAssert(CGPointDistanceToLine(CGPointMake(5., 2.), CGPointMake(3., 5.), CGPointMake(3., 6.)) == 2., @"Pass");
}

@end
