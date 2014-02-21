//
//  UIImage+VRDerivatives.h
//  toolbarTest
//
//  Created by Иван Рублев on 8/27/12.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>

BOOL isUIImageOrientationLandscape(UIImageOrientation orientation);
UIImageOrientation topOrientationFromImageOrientation(UIImageOrientation imageOrintation);
UIImageOrientation UIImageOrientationRotateRight(UIImageOrientation from, NSUInteger nTimes);
UIImageOrientation translateUIImageOrientation(UIImageOrientation from, UIImageOrientation to);
UIImageOrientation UIImageOrientationGetValid(UIImageOrientation imageOrientation); 
NSString * NSStringFromUIImageOrientation(UIImageOrientation imageOrientation);

@interface UIImage (VRDerivatives)
+ (UIImage*)decompressedImageWithContentsOfFile:(NSString*)path;
+ (UIImage *)imageWithPath:(NSString *)path;
+ (UIImage *)imageWithPath:(NSString *)path andScale:(CGFloat)scale;
- (UIImage *)decompressedImage; // havy op!
- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints;
- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints andInterpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints andInterpolationQuality:(CGInterpolationQuality)quality andUIImageScale:(CGFloat)scale;
- (UIImage *)imageWithOrientation:(UIImageOrientation)orientation; // changes imageOrintation
- (CGSize)cgSize; // returns real bitmap size not corrected by orientation
- (UIImage *)imageWithRotate:(UIImageOrientation)rotateTopToDirection;
- (UIImage *)imageWithResize:(CGSize)cgImageNewSize // if cgImageNewSize zero then no resize will occur.
                  thenRotate:(UIImageOrientation)rotateTopToDirection
     andInterpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radius:(CGFloat)radius;
- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radiuses:(NSArray *)radiuses;
- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radiusesW:(NSArray *)radiusesW radiusesH:(NSArray *)radiusesH;
- (UIImage *)imageWithRects:(NSArray *)rects color:(UIColor *)color;
- (UIImage *)putImage:(UIImage *)putImage at:(CGPoint)point;
@end
