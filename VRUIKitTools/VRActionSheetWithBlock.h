//
//  VRActionSheetWithBlock.h
//  VRUIKitTools
//
//  Created by Иван Рублев on 4/28/13.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRActionSheetWithBlock;
typedef void(^VRActionSheetWithBlockCompletionBlock)(NSUInteger buttonIndex, VRActionSheetWithBlock *actionSheet);

@interface VRActionSheetWithBlock : UIActionSheet <UIActionSheetDelegate>
- (id)initWithTitle:(NSString *)title
    completionBlock:(VRActionSheetWithBlockCompletionBlock)block
  buttonTitlesArray:(NSArray *)otherButtonTitlesArray
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle;
@end
