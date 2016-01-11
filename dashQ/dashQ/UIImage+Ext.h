//
//  UIImage+Ext.h
//  AuctionMobile
//
//  Created by sujang on 11. 5. 17..
//  Copyright 2011 eBay Auction Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

@interface UIImage(Ext)
+ (UIImage *)resizableImage:(NSString *)imageNamed;
+ (UIImage *)resizableImage:(NSString *)imageNamed offsetX:(CGFloat)x offsetY:(CGFloat)y;

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

@end


// UIImage+Alpha.m
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Private helper methods
@interface UIImage (Alpha)
- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size;
@end

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
