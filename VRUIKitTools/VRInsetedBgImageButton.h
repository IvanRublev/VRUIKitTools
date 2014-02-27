//
//  VRInsetedBgImageButton.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 4/19/13.
//  Copyright (c) 2013 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/* This class replaces background image for Normal state with derived image inseted according to insetsRect property.
 * Can be configured in IB via User Defined Runtime Attributes.
 */

@interface VRInsetedBgImageButton : UIButton
@property (nonatomic, assign) CGRect insetsRect; //x=top, y=left, width=bottom, height=right
@end
