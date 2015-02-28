//
//  VRGeometryTools.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 8/30/12.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#ifndef VR_GeometryTools_h
#define VR_GeometryTools_h

#import <CoreGraphics/CGGeometry.h>

CGRect CGRectNewSize(CGRect inputRect, CGSize size);
CGRect CGRectXYZeroWithSize(CGSize size);
CGRect CGRectXYZero(CGRect inputRect);
CGRect CGRectXZeroNewWidth(CGRect inputRect, CGFloat newWidth);
CGRect CGRectNewX(CGRect inputRect, CGFloat newX);
CGRect CGRectNewY(CGRect inputRect, CGFloat newY);
CGRect CGRectNewWidth(CGRect inputRect, CGFloat newWidth);
CGRect CGRectNewHeight(CGRect inputRect, CGFloat newHeight);
CGRect CGRectNewXandY(CGRect inputRect, CGFloat newX, CGFloat newY);
CGRect CGRectSwapAxis(CGRect inputRect);
CGRect CGRectScale(CGRect inputRect, CGFloat scale);

CGSize CGSizeFitInSize(CGSize whatSize, CGSize whereSize);
CGSize CGSizeSwap(CGSize whatSize);

CGFloat CGPointDistanceToPoint(CGPoint p1, CGPoint p2);
CGFloat CGPointDistanceToLine(CGPoint p, CGPoint lineStart, CGPoint lineEnd);
CGPoint CGPointCenterOfRect(CGRect rect);
CGPoint CGPointCenterPointBetweenPoints(CGPoint p1, CGPoint p2);

bool CGLineIntersectsLine(CGPoint line1s, CGPoint line1e, CGPoint line2s, CGPoint line2e);

#endif
