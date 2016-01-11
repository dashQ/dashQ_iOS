//
//  CommonTitleCell.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonTitleCell.h"

@implementation CommonTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CommonTitleCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonTitleCell"
                                                  owner:self
                                                options:nil];
    
    CommonTitleCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
