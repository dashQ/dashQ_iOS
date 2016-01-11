//
//  iOS8Utility.h
//  Common
//
//  Created by sujang on 2014. 10. 17..
//  Copyright (c) 2014년 ebay korea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface iOS8Utility : NSObject


@end

@interface UIViewController (SupportiOS8)

- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320;

- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320
                    alpha375:(CGFloat)alpha375
                    alpha414:(CGFloat)alpha414;


@end

@interface UITableViewCell (SupportiOS8)

- (CGFloat)heightDynamicLabel:(UILabel *)label marginWidth:(CGFloat)margin;
- (CGFloat)heightDynamicLabel:(UILabel *)label;
- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320
                    alpha375:(CGFloat)alpha375
                    alpha414:(CGFloat)alpha414;

@end;

@interface UIView (SupportiOS8)

- (void)updateHeight:(CGFloat)height;
- (void)updateWidth:(CGFloat)width;

@end;

@interface NSObject (SupportiOS8)

- (CGFloat)ratioScreenWidth;
- (CGFloat)screenWidth;

@end;
