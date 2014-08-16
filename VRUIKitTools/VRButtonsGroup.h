//
//  VRButtonsGroup.h
//  MYLToolbarExample
//
//  Created by Ivan Rublev on 8/15/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VRButtonsGroup : NSObject
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, assign) NSUInteger selectedButtonTag;
@end
