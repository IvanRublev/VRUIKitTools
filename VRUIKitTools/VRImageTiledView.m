//
//  VRImageTiledView.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 4/18/13.
//  Copyright (c) 2013 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRImageTiledView.h"

@implementation VRImageTiledView
+ (VRImageTiledView *)viewWithImageName:(NSString *)imageName
{
    VRImageTiledView * newView = [[VRImageTiledView alloc] init];
    newView.imageName = imageName;
    return newView;
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:_imageName]];
}
@end
