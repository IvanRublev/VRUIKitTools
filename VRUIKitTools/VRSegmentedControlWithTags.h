//
//  VRSegmentedControlWithTags.h
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/3/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VRSegmentedControlWithTags;

@protocol VRSegmentedControlWithTagsSegmentTouchDelegate <NSObject>
- (void)VRSegmentedControl:(VRSegmentedControlWithTags*)segmentedControl didTouchSegmentWithIndex:(NSUInteger)touchedSegmentIndex;
@end

@interface VRSegmentedControlWithTags : UISegmentedControl
- (id)initWithItems:(NSArray*)items tags:(NSArray*)tags;
- (void)insertSegmentWithImage:(UIImage*)image atIndex:(NSUInteger)segment tag:(NSInteger)tag animated:(BOOL)animated;
- (void)insertSegmentWithTitle:(NSString*)title atIndex:(NSUInteger)segment tag:(NSInteger)tag animated:(BOOL)animated;
- (void)setTag:(NSUInteger)tag forSegmentAtIndex:(NSUInteger)segment;
- (NSInteger)tagForSegmentAtIndex:(NSUInteger)segment;
@property (nonatomic, weak) IBOutlet id<VRSegmentedControlWithTagsSegmentTouchDelegate> segmentTouchDelegate;
@end
