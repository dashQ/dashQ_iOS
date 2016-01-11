//
//  iOS8Utility.m
//  Common
//
//  Created by sujang on 2014. 10. 17..
//  Copyright (c) 2014년 ebay korea. All rights reserved.
//

#import "iOS8Utility.h"

@implementation iOS8Utility

@end

@implementation UIViewController (iOS8Utility)


- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320 {

    return [self heightDynamicCell:heightWhenWidth320
                          alpha375:0.0f
                          alpha414:0.0f];
}

- (NSInteger)getScreenWidthPoint {
    return [UIScreen mainScreen].bounds.size.width;
}


- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320
                    alpha375:(CGFloat)alpha375
                    alpha414:(CGFloat)alpha414 {

    CGFloat ratio = [self ratioScreenWidth];
    CGFloat newHeight = heightWhenWidth320 * ratio;
    
    switch ([self getScreenWidthPoint]) {
        case 375:
            newHeight -= alpha375;
            break;
            
        case 414:
            newHeight -= alpha414;
            break;
            
        default:
            break;
    }
    
    return newHeight;
    
}


@end

@implementation UITableViewCell (SupportiOS8)

- (CGFloat)heightDynamicLabel:(UILabel *)label marginWidth:(CGFloat)margin {

    CGFloat newWidth = self.screenWidth - margin;

    CGSize suggestionSize = [label sizeThatFits:CGSizeMake(newWidth, 1024)];
    
    return suggestionSize.height;
    
}

- (CGFloat)heightDynamicLabel:(UILabel *)label width320:(CGFloat)width320 {

    CGFloat ratio = [self ratioScreenWidth];
    CGFloat newWidth = width320 * ratio;
    
    
    CGSize suggestionSize = [label sizeThatFits:CGSizeMake(newWidth, 1024)];
    
    return suggestionSize.height;

}
- (CGFloat)heightDynamicLabel:(UILabel *)label {

    return [self heightDynamicLabel:label width320:label.frame.size.width];
}

- (NSInteger)getScreenWidthPoint {
    return [UIScreen mainScreen].bounds.size.width;
}


- (CGFloat)heightDynamicCell:(CGFloat)heightWhenWidth320
                    alpha375:(CGFloat)alpha375
                    alpha414:(CGFloat)alpha414 {
    
    CGFloat ratio = [self ratioScreenWidth];
    CGFloat newHeight = heightWhenWidth320 * ratio;
    
    switch ([self getScreenWidthPoint]) {
        case 375:
            newHeight -= alpha375;
            break;
            
        case 414:
            newHeight -= alpha414;
            break;
            
        default:
            break;
    }
    
    return newHeight;
    
}

@end

@implementation UIView (SupportiOS8)

- (void)updateHeight:(CGFloat)height {
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

- (void)updateWidth:(CGFloat)width {
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

@end

@implementation NSObject (SupportiOS8)


- (CGFloat)ratioScreenWidth {
    return self.screenWidth / 320.0f;
}

- (CGFloat)screenWidth {
    return [UIApplication sharedApplication].keyWindow.frame.size.width;
}


@end;


