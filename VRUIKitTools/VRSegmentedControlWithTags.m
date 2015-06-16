//
//  VRSegmentedControlWithTags.m
//  VRUIKitTools
//
//  Created by Ivan Rublev on 11/3/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRSegmentedControlWithTags.h"

@interface VRSegmentedControlWithTags () {
    NSMutableArray * _segmentsTag;
}

@end

@implementation VRSegmentedControlWithTags

#pragma mark -
#pragma mark Overriding superclass methods
- (void)makeEmptyTagsOfCount:(NSUInteger)count {
    _segmentsTag = [NSMutableArray arrayWithCapacity:count];
    for (int i=0; i<count; i++) {
        [_segmentsTag addObject:@(0)];
    }
}

- (id)init {
    if ((self = [super init])) {
        [self makeEmptyTagsOfCount:self.numberOfSegments];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self makeEmptyTagsOfCount:self.numberOfSegments];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self makeEmptyTagsOfCount:self.numberOfSegments];
    }
    return self;
}

- (id)initWithItems:(NSArray*)items {
    if ((self = [super initWithItems:items])) {
        [self makeEmptyTagsOfCount:[items count]];
    }
    return self;
}

- (void)insertSegmentWithImage:(UIImage *)image atIndex:(NSUInteger)segment animated:(BOOL)animated {
    [self insertSegmentWithImage:image atIndex:segment tag:0 animated:animated];
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated {
    [self insertSegmentWithTitle:title atIndex:segment tag:0 animated:animated];
}

- (void)removeAllSegments {
    [super removeAllSegments];
    [_segmentsTag removeAllObjects];
}

- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated {
    [super removeSegmentAtIndex:segment animated:animated];
    [_segmentsTag removeObjectAtIndex:segment];
}


#pragma mark -
#pragma mark Override custom touches
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    NSInteger oldSelectedSegmentIndex = self.selectedSegmentIndex;
    [super touchesEnded:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    NSUInteger tapedIndex = (int)(location.x / (self.bounds.size.width / self.numberOfSegments));
//    NSLog(@"touched segment with index: %d earlier selected segment: %d new selected segment %d", tapedIndex, oldSelectedSegmentIndex, self.selectedSegmentIndex);
    if (oldSelectedSegmentIndex == self.selectedSegmentIndex) {
        if ([self.segmentTouchDelegate respondsToSelector:@selector(VRSegmentedControl:didTouchSegmentWithIndex:)]) {
            [self.segmentTouchDelegate VRSegmentedControl:self didTouchSegmentWithIndex:tapedIndex];
        }
    }
}

#pragma mark -
#pragma mark Public methods
- (id)initWithItems:(NSArray*)items tags:(NSArray*)tags {
    self = [super initWithItems:items];
    if (self) {
        NSAssert([tags count] == [items count], @"tags array must be the same length as items array.");
        _segmentsTag = [NSMutableArray arrayWithArray:tags];
    }
    return self;
}

- (void)insertSegmentWithImage:(UIImage *)image atIndex:(NSUInteger)segment tag:(NSInteger)tag animated:(BOOL)animated {
    [super insertSegmentWithImage:image atIndex:segment animated:animated];
    [_segmentsTag insertObject:@(tag) atIndex:segment];
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment tag:(NSInteger)tag animated:(BOOL)animated {
    [super insertSegmentWithTitle:title atIndex:segment animated:animated];
    [_segmentsTag insertObject:@(tag) atIndex:segment];
}

- (void)setTag:(NSUInteger)tag forSegmentAtIndex:(NSUInteger)segment {
    [_segmentsTag replaceObjectAtIndex:segment withObject:@(tag)];
}

- (NSInteger)tagForSegmentAtIndex:(NSUInteger)segment {
    return [[_segmentsTag objectAtIndex:segment] integerValue];
}

@end
