//
//  VRAlertViewWithBlock.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 2/2/13.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRAlertViewWithBlock.h"
#import <objc/runtime.h>

@implementation VRAlertViewWithBlock
#define VRAlertViewWithBlockCallbackName "VRAlertViewWithBlockCallbackName"

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
      prepeareBlock:(VRAlertViewWithBlockPrepeareBlock)prepeareBlock
    completionBlock:(VRAlertViewWithBlockCompletionBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	if (self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil]) {
        VRAlertViewWithBlockCompletionBlock blockCopy = [block copy];
        if (blockCopy) {
            objc_setAssociatedObject(self, VRAlertViewWithBlockCallbackName, blockCopy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
		if (cancelButtonTitle) {
			[self addButtonWithTitle:cancelButtonTitle];
			self.cancelButtonIndex = [self numberOfButtons] - 1;
		}
		id eachObject;
		va_list argumentList;
		if (otherButtonTitles) {
			[self addButtonWithTitle:otherButtonTitles];
			va_start(argumentList, otherButtonTitles);
			while ((eachObject = va_arg(argumentList, id))) {
				[self addButtonWithTitle:eachObject];
			}
			va_end(argumentList);
		}
        if (prepeareBlock) {
            VRAlertViewWithBlock __weak * weakSelf = self;
            prepeareBlock(weakSelf);
        }
	}
	return self;
}

- (void)dealloc
{
    objc_setAssociatedObject(self, VRAlertViewWithBlockCallbackName, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -
#pragma mark UIAlert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	VRAlertViewWithBlockCompletionBlock callbackBlock = objc_getAssociatedObject(self, VRAlertViewWithBlockCallbackName);
    if (callbackBlock) {
        VRAlertViewWithBlock __weak * weakSelf = self;
        callbackBlock(buttonIndex, weakSelf);
    }
}


@end
