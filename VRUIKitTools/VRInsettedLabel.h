//
//  VRInsettedLabel.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 8/20/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VRInsettedLabel : UILabel
@property (nonatomic, readwrite) NSNumber * top;
@property (nonatomic, readwrite) NSNumber * bottom;
@property (nonatomic, readwrite) NSNumber * left;
@property (nonatomic, readwrite) NSNumber * right;
@end
