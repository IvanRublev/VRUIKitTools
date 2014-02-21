//
//  VRActionSheetWithBlock.m
//  VRUIKitTools
//
//  Created by Иван Рублев on 4/28/13.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRActionSheetWithBlock.h"
#import <objc/runtime.h>

@implementation VRActionSheetWithBlock
#define VRActionSheetWithBlockCallbackName "VRActionSheetWithBlockCallbackName"

- (id)initWithTitle:(NSString *)title completionBlock:(VRActionSheetWithBlockCompletionBlock)block buttonTitlesArray:(NSArray *)otherButtonTitlesArray cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle
{
    objc_setAssociatedObject(self, VRActionSheetWithBlockCallbackName, [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	if (self = [self initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil]) {
        for (NSString * buttonTitle in otherButtonTitlesArray) {
            [self addButtonWithTitle:buttonTitle];
        }
        if (destructiveButtonTitle) {
			[self addButtonWithTitle:destructiveButtonTitle];
			self.destructiveButtonIndex = [self numberOfButtons] - 1;
		}
		if (cancelButtonTitle) {
			[self addButtonWithTitle:cancelButtonTitle];
			self.cancelButtonIndex = [self numberOfButtons] - 1;
		}
	}
	return self;
}

- (void)dealloc
{
    objc_setAssociatedObject(self, VRActionSheetWithBlockCallbackName, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -
#pragma mark UIActionSheet view delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	VRActionSheetWithBlockCompletionBlock block = objc_getAssociatedObject(self, VRActionSheetWithBlockCallbackName);
	block(buttonIndex, self);
}

@end
