//
//  VRButtonsGroup.m
//  MYLToolbarExample
//
//  Created by Ivan Rublev on 8/15/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRButtonsGroup.h"

@interface VRButtonsGroup ()
@end;

@implementation VRButtonsGroup

#pragma mark -
#pragma mark Public Setters
- (void)setSelectedButtonTag:(NSUInteger)selectedButtonTag
{
    _selectedButtonTag = selectedButtonTag;
    // Reselect buttons according to passed tag
    [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * btn = obj;
        btn.selected = (btn.tag == selectedButtonTag);
    }];
}

- (void)setButtons:(NSArray *)buttons
{
    UIControlEvents touchEvents = UIControlEventTouchUpInside | UIControlEventTouchUpOutside;
    // Remove actions for current buttons
    [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * btn = obj;
        [btn removeTarget:self action:NULL forControlEvents:touchEvents];
    }];
    // Add action handler for current buttons
    [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * btn = obj;
        [btn addTarget:self action:@selector(buttonWasTouched:) forControlEvents:touchEvents];
    }];
    _buttons = buttons;
    self.selectedButtonTag = _selectedButtonTag;
}

#pragma mark -
#pragma mark Private
- (void)buttonWasTouched:(UIButton *)sender
{
    self.selectedButtonTag = sender.tag;
}

@end
