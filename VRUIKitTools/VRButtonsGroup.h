//
//  VRButtonsGroup.h
//  MYLToolbarExample
//
//  Created by Ivan Rublev on 8/15/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  This is useful to make option group switch between buttons.
 *  Set unique tag to each of grouped buttons, add them to collection.
 *  Touch handler will be added to each button.
 *  selectedButton tag will store the tag of button pressed last.
 *  The selected flag of buttons will be changed automatically.
 */

@interface VRButtonsGroup : NSObject
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, assign) NSUInteger selectedButtonTag;
@end
