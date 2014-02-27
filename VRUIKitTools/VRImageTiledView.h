//
//  VRImageTiledView.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 4/18/13.
//  Copyright (c) 2013 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/* This class fills background of itself with specified image tiled.
 * Can be configured in IB via User Defined Runtime Attributes.
 */

@interface VRImageTiledView : UIView
+ (VRImageTiledView *)viewWithImageName:(NSString *)imageName;
@property (nonatomic, readwrite, strong) NSString * imageName;
@end
