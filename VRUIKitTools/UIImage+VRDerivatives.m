//
//  UIImage+VRDerivatives.m
//  toolbarTest
//
//  Created by Иван Рублев on 8/27/12.
//  Copyright (c) 2012 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIImage+VRDerivatives.h"
#import "VRGeometryTools.h"

BOOL isUIImageOrientationLandscape(UIImageOrientation orientation)
{
    return (UIImageOrientationRight == orientation ||
            UIImageOrientationLeft == orientation ||
            UIImageOrientationRightMirrored == orientation ||
            UIImageOrientationLeftMirrored == orientation);
}


// Returns where top of CGImage is really oriented.
// We think that top of our image after applying of imageOrintation looks up.
// So we can find out where it's really looks to
UIImageOrientation topOrientationFromImageOrientation(UIImageOrientation imageOrintation)
{
    switch (imageOrintation) {
        default:
        case UIImageOrientationRight:
            return UIImageOrientationLeft;
            break;
        case UIImageOrientationDown:
            return UIImageOrientationDown;
            break;
        case UIImageOrientationLeft:
            return UIImageOrientationRight;
            break;
        case UIImageOrientationUp:
            return UIImageOrientationUp;
            break;
        case UIImageOrientationRightMirrored:
            return UIImageOrientationLeftMirrored;
            break;
        case UIImageOrientationDownMirrored:
            return UIImageOrientationDownMirrored;
            break;
        case UIImageOrientationLeftMirrored:
            return UIImageOrientationRightMirrored;
            break;
        case UIImageOrientationUpMirrored:
            return UIImageOrientationUpMirrored;
            break;
        
    }
}

// Returns orientation rotated to nTimes right
UIImageOrientation UIImageOrientationRotateRight(UIImageOrientation from, NSUInteger nTimes)
{
    if (nTimes > 4) {
        nTimes = nTimes-(nTimes % 4);
    }
   
    switch (nTimes) {
        default:
        case 0:
            return from;
            break;
        case 1:
            switch (from) {
                default:
                case UIImageOrientationUp:
                    return UIImageOrientationRight;
                    break;
                case UIImageOrientationRight:
                    return UIImageOrientationDown;
                    break;
                case UIImageOrientationDown:
                    return UIImageOrientationLeft;
                    break;
                case UIImageOrientationLeft:
                    return UIImageOrientationUp;
                    break;
                case UIImageOrientationUpMirrored:    // as above but image mirrored along other axis. horizontal flip
                    return UIImageOrientationRightMirrored;
                    break;
                case UIImageOrientationRightMirrored: // vertical flip
                    return UIImageOrientationDownMirrored;
                    break;
                case UIImageOrientationDownMirrored:  // horizontal flip
                    return UIImageOrientationLeftMirrored;
                    break;
                case UIImageOrientationLeftMirrored:  // vertical flip
                    return UIImageOrientationUpMirrored;
                    break;
            }
            break;
        case 2:
            switch (from) {
                default:
                case UIImageOrientationUp:
                    return UIImageOrientationDown;
                    break;
                case UIImageOrientationRight:
                    return UIImageOrientationLeft;
                    break;
                case UIImageOrientationDown:
                    return UIImageOrientationUp;
                    break;
                case UIImageOrientationLeft:
                    return UIImageOrientationRight;
                    break;
                case UIImageOrientationUpMirrored:    // as above but image mirrored along other axis. horizontal flip
                    return UIImageOrientationDownMirrored;
                    break;
                case UIImageOrientationRightMirrored: // vertical flip
                    return UIImageOrientationLeftMirrored;
                    break;
                case UIImageOrientationDownMirrored:  // horizontal flip
                    return UIImageOrientationUpMirrored;
                    break;
                case UIImageOrientationLeftMirrored:  // vertical flip
                    return UIImageOrientationRightMirrored;
                    break;
            }
            break;
        case 3:
            switch (from) {
                default:
                case UIImageOrientationUp:
                    return UIImageOrientationLeft;
                    break;
                case UIImageOrientationRight:
                    return UIImageOrientationUp;
                    break;
                case UIImageOrientationDown:
                    return UIImageOrientationRight;
                    break;
                case UIImageOrientationLeft:
                    return UIImageOrientationDown;
                    break;
                case UIImageOrientationUpMirrored:    // as above but image mirrored along other axis. horizontal flip
                    return UIImageOrientationLeftMirrored;
                    break;
                case UIImageOrientationRightMirrored: // vertical flip
                    return UIImageOrientationUpMirrored;
                    break;
                case UIImageOrientationDownMirrored:  // horizontal flip
                    return UIImageOrientationRightMirrored;
                    break;
                case UIImageOrientationLeftMirrored:  // vertical flip
                    return UIImageOrientationDownMirrored;
                    break;
            }
            break;
    }
}

// Returns orientation which allows to translate raw CGImage from it's current real oriantation to distant
UIImageOrientation translateUIImageOrientation(UIImageOrientation from, UIImageOrientation to)
{
    // Our image from camera lies on left side, so it's head will point UIImageOrientationLeft

    return UIImageOrientationRotateRight(to, 1);
    
//    switch (to) {
//        default:
//        case UIImageOrientationUp:
//            return UIImageOrientationRight;
//            break;
//        case UIImageOrientationRight:
//            return UIImageOrientationDown;
//            break;
//        case UIImageOrientationDown:
//            return UIImageOrientationLeft;
//            break;
//        case UIImageOrientationLeft:
//            return UIImageOrientationUp;
//            break;
//        case UIImageOrientationUpMirrored:    // as above but image mirrored along other axis. horizontal flip
//            return UIImageOrientationRightMirrored;
//            break;
//        case UIImageOrientationRightMirrored: // vertical flip
//            return UIImageOrientationDownMirrored;
//            break;
//        case UIImageOrientationDownMirrored:  // horizontal flip
//            return UIImageOrientationLeftMirrored;
//            break;
//        case UIImageOrientationLeftMirrored:  // vertical flip
//            return UIImageOrientationUpMirrored;
//            break;
//    }
    
}

// Returns imageOrientation if it's valid or UIImageOrientationUp
UIImageOrientation UIImageOrientationGetValid(UIImageOrientation imageOrientation)
{
    return (UIImageOrientationUp == imageOrientation ||
            UIImageOrientationDown == imageOrientation ||
            UIImageOrientationLeft == imageOrientation ||
            UIImageOrientationRight == imageOrientation ||
            UIImageOrientationUpMirrored == imageOrientation ||
            UIImageOrientationDownMirrored == imageOrientation ||
            UIImageOrientationLeftMirrored == imageOrientation ||
            UIImageOrientationRightMirrored == imageOrientation) ? imageOrientation : UIImageOrientationUp;
}

NSString * NSStringFromUIImageOrientation(UIImageOrientation imageOrientation)
{
    return
    UIImageOrientationUp == imageOrientation ? @"UIImageOrientationUp" :
    UIImageOrientationDown == imageOrientation ? @"UIImageOrientationDown" :
    UIImageOrientationLeft == imageOrientation ? @"UIImageOrientationLeft" :
    UIImageOrientationRight == imageOrientation ? @"UIImageOrientationRight" :
    UIImageOrientationUpMirrored == imageOrientation ? @"UIImageOrientationUpMirrored" :
    UIImageOrientationDownMirrored == imageOrientation ? @"UIImageOrientationDownMirrored" :
    UIImageOrientationLeftMirrored == imageOrientation ? @"UIImageOrientationLeftMirrored" :
    UIImageOrientationRightMirrored == imageOrientation ? @"UIImageOrientationRightMirrored" : @"unknown";
}

// Helper function
void scaledImageReleaseCallocatedData (void *info, const void *data, size_t size)
{
    free(info);
}

@implementation UIImage (VRDerivatives)

+ (UIImage*)decompressedImageWithContentsOfFile:(NSString*)path {
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path]; // not cached in system.
    return [image decompressedImage];
}

+ (UIImage *)imageWithPath:(NSString *)path
{
    return [UIImage imageWithPath:path andScale:1.0f];
}

// Returns image without internal caching.
+ (UIImage *)imageWithPath:(NSString *)path andScale:(CGFloat)scale
{
    UIImage * diskImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil]];
    return nil != diskImage ? [UIImage imageWithCGImage:diskImage.CGImage scale:scale orientation:diskImage.imageOrientation] : nil;
}

- (UIImage *)decompressedImage
{
    UIImage * srcImage = self;
    if (srcImage == nil) {
        return nil;
    }
    CGImageRef imageRef = [srcImage CGImage];
    CGRect rect = CGRectMake(0.f, 0.f, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       rect.size.width,
                                                       rect.size.height,
                                                       CGImageGetBitsPerComponent(imageRef),
                                                       CGImageGetBytesPerRow(imageRef),
                                                       CGImageGetColorSpace(imageRef),
                                                       CGImageGetBitmapInfo(imageRef)
                                                       );
    CGContextDrawImage(bitmapContext, rect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(bitmapContext);
    UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef scale:srcImage.scale orientation:srcImage.imageOrientation];
    CGImageRelease(decompressedImageRef);
    CGContextRelease(bitmapContext);
    return decompressedImage;
}

- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints
{
    return [self scaledImageWithSize:newSizeInPoints andInterpolationQuality:kCGInterpolationLow];
}

- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints andInterpolationQuality:(CGInterpolationQuality)quality
{
    return [self scaledImageWithSize:newSizeInPoints andInterpolationQuality:quality andUIImageScale:self.scale];
}

- (UIImage *)scaledImageWithSize:(CGSize)newSizeInPoints andInterpolationQuality:(CGInterpolationQuality)quality andUIImageScale:(CGFloat)scale
{
    // scales image to new size in pixels. New image have same orientation and scale as source.
    
    UIImage * srcImage = self;
    if (srcImage == nil) {
        return nil;
    }
    
    if (CGSizeEqualToSize(srcImage.size, newSizeInPoints)) {
        return srcImage;
    }
    
    size_t newSizeWidth; // in pixels
    size_t newSizeHeight;
    
    // swap new size if needed
    if (srcImage.imageOrientation == UIImageOrientationRight ||
        srcImage.imageOrientation == UIImageOrientationLeft ||
        srcImage.imageOrientation == UIImageOrientationRightMirrored ||
        srcImage.imageOrientation == UIImageOrientationLeftMirrored) {
        
        newSizeWidth = newSizeInPoints.height * srcImage.scale;
        newSizeHeight = newSizeInPoints.width * srcImage.scale;
    } else {
        newSizeWidth = newSizeInPoints.width * srcImage.scale;
        newSizeHeight = newSizeInPoints.height * srcImage.scale;
    }
            
    CGImageRef srcCGImage = srcImage.CGImage;
    CGImageRetain(srcCGImage);
    
    // Obtain information about source image
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerPixel = (int)ceilf((float)bitsPerPixel / 8.0f);
    
    // create context and draw resized
    void *imageData = NULL;

    size_t dataSize = (int)newSizeWidth * (int)newSizeHeight * bytesPerPixel;
    imageData = calloc(1, dataSize);
    
    
    CGContextRef imageContext = 
    CGBitmapContextCreate(
                          imageData,
                          newSizeWidth,
                          newSizeHeight, 
                          bitsPerComponent,
                          newSizeWidth * bytesPerPixel,
                          colorSpace,  
                          kCGImageAlphaPremultipliedLast
                          );
   
    CGContextSetInterpolationQuality(imageContext, quality); 

    CGContextDrawImage(imageContext, CGRectMake(0.0, 0.0, newSizeWidth, newSizeHeight), srcCGImage);
    
    CGContextRelease(imageContext);
   
    
    // make image from data
    CGDataProviderRef processedJoinedProvider = CGDataProviderCreateWithData(imageData, imageData, dataSize, scaledImageReleaseCallocatedData);
    
    CGImageRef cgImageJoined =
    CGImageCreate(newSizeWidth,
                  newSizeHeight, 
                  bitsPerComponent,
                  bitsPerPixel,
                  newSizeWidth * bytesPerPixel,
                  colorSpace,
                  kCGImageAlphaPremultipliedLast,
                  processedJoinedProvider, 
                  NULL,
                  true,
                  kCGRenderingIntentDefault); 

    UIImage * processedJoinedImage = [UIImage imageWithCGImage:cgImageJoined scale:scale orientation:srcImage.imageOrientation];
    
    CGImageRelease(cgImageJoined);
    
    CGDataProviderRelease(processedJoinedProvider);

    CGColorSpaceRelease(colorSpace);
    
    CGImageRelease(srcCGImage);

    return processedJoinedImage;
}

- (UIImage *)imageWithOrientation:(UIImageOrientation)orientation
{
   return [UIImage imageWithCGImage:[self CGImage] scale:self.scale orientation:orientation];
}

- (CGSize)cgSize
{
    return CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));
}

- (UIImage *)imageWithRotate:(UIImageOrientation)rotateTopToDirection
{
    return [self imageWithResize:CGSizeZero thenRotate:rotateTopToDirection andInterpolationQuality:kCGInterpolationDefault];
}

// Resizes CGImage to newSize then
// rotates CGImage data accordign to desired orientation
// After this UIImage forgets about original orientation but not scale
- (UIImage *)imageWithResize:(CGSize)cgImageNewSize // if cgImageNewSize zero then no resize will occur.
                  thenRotate:(UIImageOrientation)rotateTopToDirection
     andInterpolationQuality:(CGInterpolationQuality)quality
{
    UIImage * srcImage = self;
    if (srcImage == nil) {
        return nil;
    }
    
    if (rotateTopToDirection == UIImageOrientationUp) {
        return [UIImage imageWithCGImage:srcImage.CGImage scale:srcImage.scale orientation:UIImageOrientationUp];
    }
    // --- Determine where to rotate? ---
    CGSize srcImagecgSize = CGSizeEqualToSize(cgImageNewSize, CGSizeZero) ? [srcImage cgSize] : cgImageNewSize;
    CGSize newPixelSize = srcImagecgSize; // pixel size
    CGFloat angle = 0.0f;
    CGFloat tx = 0.0f;
    CGFloat ty = 0.0f;
    CGFloat scaleX = 1.0;
    CGFloat scaleY = 1.0;
    switch (rotateTopToDirection) {
        default:
        case UIImageOrientationUp:
            angle = 0.0f;
            tx = 0.0f;
            ty = 0.0f;
            break;
        case UIImageOrientationRight:
            angle = -(90.0f/180.0f)*M_PI;
            newPixelSize = CGSizeSwap(newPixelSize);
            tx = 0.0f;
            ty = newPixelSize.height;
            break;
        case UIImageOrientationLeftMirrored:
            angle = -(90.0f/180.0f)*M_PI;
            newPixelSize = CGSizeSwap(newPixelSize);
            tx = newPixelSize.width;
            scaleX = -1.0;
            ty = newPixelSize.height;
            break;
        case UIImageOrientationLeft:
            angle = (90.0f/180.0f)*M_PI;
            newPixelSize = CGSizeSwap(newPixelSize);
            tx = newPixelSize.width;
            ty = 0.0f;
            break;
        case UIImageOrientationDown:
            angle = M_PI;
            tx = newPixelSize.width;
            ty = newPixelSize.height;
            break;
    }
    
    // --- Rotate image data ---
    CGImageRef srcCGImage = srcImage.CGImage;
    CGImageRetain(srcCGImage);
    
    // Obtain information about source image
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerPixel = (int)ceilf((float)bitsPerPixel / 8.0f);
    
    // create context and draw resized
    void *imageData = NULL;
    
    size_t dataSize = (int)newPixelSize.width * (int)newPixelSize.height * bytesPerPixel;
    imageData = calloc(1, dataSize);
    
    CGBitmapInfo bitmapType = (kCGBitmapByteOrderMask & kCGBitmapByteOrderDefault) | (kCGBitmapAlphaInfoMask & kCGImageAlphaNoneSkipLast);
    
    CGContextRef imageContext =
    CGBitmapContextCreate(
                          imageData,
                          (int)newPixelSize.width,
                          (int)newPixelSize.height,
                          bitsPerComponent,
                          (int)newPixelSize.width * bytesPerPixel,
                          colorSpace,
                          bitmapType
                          );
    CGContextSetInterpolationQuality(imageContext, quality);
    CGContextTranslateCTM (imageContext, tx, ty);
    CGContextScaleCTM(imageContext, scaleX, scaleY);
    CGContextRotateCTM (imageContext, angle);
    CGContextSetInterpolationQuality(imageContext, kCGInterpolationDefault);
    CGContextDrawImage(imageContext, CGRectMake(0.0, 0.0, srcImagecgSize.width, srcImagecgSize.height), srcCGImage);
    
    CGContextRelease(imageContext);
    
    
    // make image from data
    CGDataProviderRef processedJoinedProvider = CGDataProviderCreateWithData(imageData, imageData, dataSize, scaledImageReleaseCallocatedData);
    
    CGImageRef cgImageJoined =
    CGImageCreate((int)newPixelSize.width,
                  (int)newPixelSize.height,
                  bitsPerComponent,
                  bitsPerPixel,
                  (int)newPixelSize.width * bytesPerPixel,
                  colorSpace,
                  bitmapType,
                  processedJoinedProvider,
                  NULL,
                  true,
                  kCGRenderingIntentDefault);

    // make new UIImage with orientation top.
    UIImage * processedJoinedImage = [UIImage imageWithCGImage:cgImageJoined scale:srcImage.scale orientation:UIImageOrientationUp];
    
    CGImageRelease(cgImageJoined);
    
    CGDataProviderRelease(processedJoinedProvider);
    
    CGColorSpaceRelease(colorSpace);
    
    CGImageRelease(srcCGImage);
    
    return processedJoinedImage;
}

- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radius:(CGFloat)radius // arrayOfPoints contains
{
    NSMutableArray * radiusesArray = [NSMutableArray arrayWithCapacity:[arrayOfPoints count]];
    for (int i=0; i<[arrayOfPoints count]; i++) {
        [radiusesArray addObject:@(radius)];
    }
    return [self imageWithDots:arrayOfPoints color:color radiuses:radiusesArray];
}

- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radiuses:(NSArray *)radiuses // arrayOfPoints contains CGPoints in NSValue, and array of NSNumbers
{
    return [self imageWithDots:arrayOfPoints color:color radiusesW:radiuses radiusesH:radiuses];
}

- (UIImage *)imageWithDots:(NSArray *)arrayOfPoints color:(UIColor *)color radiusesW:(NSArray *)radiusesW radiusesH:(NSArray *)radiusesH // arrayOfPoints contains CGPoints in NSValue, and array of NSNumbers
{
    // returns image with dots puted on it of radius and color
    
    UIImage * srcImage = self;
    if (srcImage == nil) {
        return nil;
    }
    if (![arrayOfPoints count]) {
        return nil;
    }
    if (!color) {
        return nil;
    }
    if (![radiusesW count] ||
        ![radiusesH count]) {
        return nil;
    }
    if (([radiusesW count] != [arrayOfPoints count]) ||
        ([radiusesH count] != [arrayOfPoints count])) {
        return nil;
    }
    
    size_t newSizeWidth; // in pixels
    size_t newSizeHeight;
    CGSize newSizeInPoints = [srcImage cgSize];
    
    // swap new size if needed
    if (srcImage.imageOrientation == UIImageOrientationRight ||
        srcImage.imageOrientation == UIImageOrientationLeft ||
        srcImage.imageOrientation == UIImageOrientationRightMirrored ||
        srcImage.imageOrientation == UIImageOrientationLeftMirrored) {
        
        newSizeWidth = newSizeInPoints.height * srcImage.scale;
        newSizeHeight = newSizeInPoints.width * srcImage.scale;
    } else {
        newSizeWidth = newSizeInPoints.width * srcImage.scale;
        newSizeHeight = newSizeInPoints.height * srcImage.scale;
    }
    
    CGImageRef srcCGImage = srcImage.CGImage;
    CGImageRetain(srcCGImage);
    
    // Obtain information about source image
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerPixel = (int)ceilf((float)bitsPerPixel / 8.0f);
    
    // create context and draw resized
    void *imageData = NULL;
    
    size_t dataSize = (int)newSizeWidth * (int)newSizeHeight * bytesPerPixel;
    imageData = calloc(1, dataSize);
    
    
    CGContextRef imageContext =
    CGBitmapContextCreate(
                          imageData,
                          newSizeWidth,
                          newSizeHeight,
                          bitsPerComponent,
                          newSizeWidth * bytesPerPixel,
                          colorSpace,
                          kCGImageAlphaPremultipliedLast
                          );
    CGContextDrawImage(imageContext, CGRectMake(0.0, 0.0, newSizeWidth, newSizeHeight), srcCGImage);
    CGContextTranslateCTM (imageContext, 0.0, newSizeHeight);
    CGContextScaleCTM(imageContext, 1.0, -1.0);
    CGContextSetFillColorWithColor(imageContext, color.CGColor);
    [arrayOfPoints enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSValue * value = obj;
        CGPoint point = [value CGPointValue];
        if (point.x > newSizeWidth-1 ||
            point.x < 0 ||
            point.y > newSizeHeight-1 ||
            point.y < 0) {
            NSLog(@"point: %@ out of image bounds %@.", NSStringFromCGPoint(point), NSStringFromCGSize(CGSizeMake(newSizeWidth, newSizeHeight)));
        } else {
            CGFloat radiusW = [[radiusesW objectAtIndex:idx] floatValue];
            CGFloat radiusH = [[radiusesH objectAtIndex:idx] floatValue];
            CGRect ellipseRect = CGRectMake(point.x-radiusW, point.y-radiusH, radiusW*2.0, radiusH*2.0);
            CGContextMoveToPoint(imageContext, point.x, point.y);
            CGContextAddEllipseInRect(imageContext, ellipseRect);
            CGContextClosePath(imageContext);
        }
    }];
    CGContextFillPath(imageContext);
    CGContextRelease(imageContext);
    
    
    // make image from data
    CGDataProviderRef processedJoinedProvider = CGDataProviderCreateWithData(imageData, imageData, dataSize, scaledImageReleaseCallocatedData);
    
    CGImageRef cgImageJoined =
    CGImageCreate(newSizeWidth,
                  newSizeHeight,
                  bitsPerComponent,
                  bitsPerPixel,
                  newSizeWidth * bytesPerPixel,
                  colorSpace,
                  kCGImageAlphaPremultipliedLast,
                  processedJoinedProvider,
                  NULL,
                  true,
                  kCGRenderingIntentDefault);
    
    UIImage * processedJoinedImage = [UIImage imageWithCGImage:cgImageJoined scale:srcImage.scale orientation:srcImage.imageOrientation];
    CGImageRelease(cgImageJoined);
    CGDataProviderRelease(processedJoinedProvider);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(srcCGImage);
    return processedJoinedImage;
}

- (UIImage *)imageWithRects:(NSArray *)rects color:(UIColor *)color // array of NSValue of CGRect value
{
    // returns image with dots puted on it of radius and color
    
    UIImage * srcImage = self;
    if (srcImage == nil) {
        return nil;
    }
    if (![rects count]) {
        return nil;
    }
    if (!color) {
        return nil;
    }
    
    size_t newSizeWidth; // in pixels
    size_t newSizeHeight;
    CGSize newSizeInPoints = [srcImage cgSize];
    
    // swap new size if needed
    if (srcImage.imageOrientation == UIImageOrientationRight ||
        srcImage.imageOrientation == UIImageOrientationLeft ||
        srcImage.imageOrientation == UIImageOrientationRightMirrored ||
        srcImage.imageOrientation == UIImageOrientationLeftMirrored) {
        
        newSizeWidth = newSizeInPoints.height * srcImage.scale;
        newSizeHeight = newSizeInPoints.width * srcImage.scale;
    } else {
        newSizeWidth = newSizeInPoints.width * srcImage.scale;
        newSizeHeight = newSizeInPoints.height * srcImage.scale;
    }
    
    CGImageRef srcCGImage = srcImage.CGImage;
    CGImageRetain(srcCGImage);
    
    // Obtain information about source image
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerPixel = (int)ceilf((float)bitsPerPixel / 8.0f);
    
    // create context and draw resized
    void *imageData = NULL;
    
    size_t dataSize = (int)newSizeWidth * (int)newSizeHeight * bytesPerPixel;
    imageData = calloc(1, dataSize);
    
    
    CGContextRef imageContext =
    CGBitmapContextCreate(
                          imageData,
                          newSizeWidth,
                          newSizeHeight,
                          bitsPerComponent,
                          newSizeWidth * bytesPerPixel,
                          colorSpace,
                          kCGImageAlphaPremultipliedLast
                          );
    CGContextDrawImage(imageContext, CGRectMake(0.0, 0.0, newSizeWidth, newSizeHeight), srcCGImage);
    CGContextTranslateCTM (imageContext, 0.0, newSizeHeight);
    CGContextScaleCTM(imageContext, 1.0, -1.0);
    CGContextSetStrokeColorWithColor(imageContext, color.CGColor);
    CGContextSetLineWidth(imageContext, 2);
    CGContextSetFillColorWithColor(imageContext, [[color colorWithAlphaComponent:0.2] CGColor]);
    [rects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSValue * value = obj;
        CGRect rect = [value CGRectValue];
        if (!CGRectContainsRect(CGRectMake(0, 0, newSizeWidth, newSizeHeight), rect)) {
            NSLog(@"rect: %@ out of image bounds %@.", NSStringFromCGRect(rect), NSStringFromCGSize(CGSizeMake(newSizeWidth, newSizeHeight)));
        } else {
            CGContextAddRect(imageContext, rect);
            CGContextFillPath(imageContext);
            CGContextStrokePath(imageContext);
        }
    }];
    CGContextFillPath(imageContext);
    CGContextRelease(imageContext);
    
    
    // make image from data
    CGDataProviderRef processedJoinedProvider = CGDataProviderCreateWithData(imageData, imageData, dataSize, scaledImageReleaseCallocatedData);
    
    CGImageRef cgImageJoined =
    CGImageCreate(newSizeWidth,
                  newSizeHeight,
                  bitsPerComponent,
                  bitsPerPixel,
                  newSizeWidth * bytesPerPixel,
                  colorSpace,
                  kCGImageAlphaPremultipliedLast,
                  processedJoinedProvider,
                  NULL,
                  true,
                  kCGRenderingIntentDefault);
    
    UIImage * processedJoinedImage = [UIImage imageWithCGImage:cgImageJoined scale:srcImage.scale orientation:srcImage.imageOrientation];
    CGImageRelease(cgImageJoined);
    CGDataProviderRelease(processedJoinedProvider);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(srcCGImage);
    return processedJoinedImage;
}

- (UIImage *)putImage:(UIImage *)putImage at:(CGPoint)point
{
    if (!self || !putImage) {
        return nil;
    }
    point.x = point.x * self.scale; // convert to pixels
    point.y = point.y * self.scale;
    UIImage * srcImage = self;
    size_t newSizeWidth = srcImage.cgSize.width;
    size_t newSizeHeight = srcImage.cgSize.height;
    if (point.x < 0.0) {
        point.x += newSizeWidth;
    }
    if (point.y < 0.0) {
        point.y += newSizeHeight;
    }
    if (!CGRectContainsPoint(CGRectMake(0, 0, newSizeWidth, newSizeHeight), point)) {
        NSAssert(FALSE, @"point is out of self bounds!");
        return self;
    }
    point.y = newSizeHeight-(point.y+putImage.cgSize.height); // change zero point to core image's
    
    CGImageRef srcCGImage = srcImage.CGImage;
    CGImageRetain(srcCGImage);

    // Obtain information about source image
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t bitsPerComponent = 8;
    size_t bitsPerPixel = 32;
    size_t bytesPerPixel = (int)ceilf((float)bitsPerPixel / 8.0f);
    
    // create context and draw resized
    void *imageData = NULL;
    size_t dataSize = (int)newSizeWidth * (int)newSizeHeight * bytesPerPixel;
    imageData = calloc(1, dataSize);
    
    CGContextRef imageContext =
    CGBitmapContextCreate(
                          imageData,
                          newSizeWidth,
                          newSizeHeight,
                          bitsPerComponent,
                          newSizeWidth * bytesPerPixel,
                          colorSpace,
                          kCGImageAlphaPremultipliedLast
                          );
    CGContextDrawImage(imageContext, CGRectMake(0.0, 0.0, newSizeWidth, newSizeHeight), srcCGImage);
    CGContextDrawImage(imageContext, CGRectMake(point.x, point.y, putImage.cgSize.width, putImage.cgSize.height), putImage.CGImage);
    CGContextRelease(imageContext);
    
    // make image from data
    CGDataProviderRef processedJoinedProvider = CGDataProviderCreateWithData(imageData, imageData, dataSize, scaledImageReleaseCallocatedData);
    
    CGImageRef cgImageJoined =
    CGImageCreate(newSizeWidth,
                  newSizeHeight,
                  bitsPerComponent,
                  bitsPerPixel,
                  newSizeWidth * bytesPerPixel,
                  colorSpace,
                  kCGImageAlphaPremultipliedLast,
                  processedJoinedProvider,
                  NULL,
                  true,
                  kCGRenderingIntentDefault);
    
    UIImage * processedJoinedImage = [UIImage imageWithCGImage:cgImageJoined scale:srcImage.scale orientation:srcImage.imageOrientation];
    CGImageRelease(cgImageJoined);
    CGDataProviderRelease(processedJoinedProvider);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(srcCGImage);
    return processedJoinedImage;
}

@end
