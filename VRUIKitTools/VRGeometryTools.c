//
//  VRGeometryTools.c
//  VRUIKitTools
//
//  Created by Ivan Rublev on 8/30/12.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRGeometryTools.h"
#import "math.h"

CGRect CGRectNewSize(CGRect inputRect, CGSize size)
{
    return CGRectMake(inputRect.origin.x, inputRect.origin.y, size.width, size.height);    
}

CGRect CGRectXYZeroWithSize(CGSize size)
{
    return CGRectMake(0.0f, 0.0f, size.width, size.height);    
}

CGRect CGRectXYZero(CGRect inputRect)
{
    return CGRectXYZeroWithSize(inputRect.size);
}

CGRect CGRectXZeroNewWidth(CGRect inputRect, CGFloat newWidth)
{
    return CGRectMake(0.0f, inputRect.origin.y, newWidth, inputRect.size.height);
}

CGRect CGRectNewX(CGRect inputRect, CGFloat newX)
{
    return CGRectMake(newX, inputRect.origin.y, inputRect.size.width, inputRect.size.height);
}

CGRect CGRectNewY(CGRect inputRect, CGFloat newY)
{
    return CGRectMake(inputRect.origin.x, newY, inputRect.size.width, inputRect.size.height);
}

CGRect CGRectNewWidth(CGRect inputRect, CGFloat newWidth)
{
    return CGRectMake(inputRect.origin.x, inputRect.origin.y, newWidth, inputRect.size.height);
}

CGRect CGRectNewHeight(CGRect inputRect, CGFloat newHeight)
{
    return CGRectMake(inputRect.origin.x, inputRect.origin.y, inputRect.size.width, newHeight);
}

CGRect CGRectNewXandY(CGRect inputRect, CGFloat newX, CGFloat newY)
{
    return CGRectMake(newX, newY, inputRect.size.width, inputRect.size.height);
}

CGSize CGSizeFitInSize(CGSize whatSize, CGSize whereSize)
{
    CGSize result = CGSizeZero;
    result = CGSizeMake(whereSize.width, whatSize.height * whereSize.width / whatSize.width);
    if (result.height > whereSize.height) {
        result = CGSizeMake(result.width * whereSize.height / result.height, whereSize.height);
    }
    return result;
}

CGSize CGSizeSwap(CGSize whatSize)
{
    return CGSizeMake(whatSize.height, whatSize.width);
}


CGFloat CGPointDistanceToPoint(CGPoint p1, CGPoint p2)
{
    return sqrtf(powf(p1.x - p2.x, 2.0f)+powf(p1.y - p2.y, 2.0f));
}

CGPoint CGPointCenterOfRect(CGRect rect)
{
    return CGPointMake(rect.origin.x + rect.size.width / 2.0f, rect.origin.y + rect.size.height / 2.0f);
}