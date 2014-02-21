//
//  VRAlertViewWithBlock.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 2/2/13.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRAlertViewWithBlock;
typedef void(^VRAlertViewWithBlockCompletionBlock)(NSUInteger buttonIndex, VRAlertViewWithBlock * alertView);
typedef void(^VRAlertViewWithBlockPrepeareBlock)(VRAlertViewWithBlock * alertView);

@interface VRAlertViewWithBlock : UIAlertView
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
      prepeareBlock:(VRAlertViewWithBlockPrepeareBlock)prepeareBlock
    completionBlock:(VRAlertViewWithBlockCompletionBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
