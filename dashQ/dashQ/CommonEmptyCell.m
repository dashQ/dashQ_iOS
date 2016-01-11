//
//  CommonEmptyCell.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonEmptyCell.h"

@implementation CommonEmptyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CommonEmptyCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonEmptyCell"
                                                  owner:self
                                                options:nil];
    
    CommonEmptyCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
