//
//  HomeItemCell.m
//  Hoot
//
//  Created by Hoyool Yoon on 9/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "HomeItemCell.h"

@implementation HomeItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HomeItemCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HomeItemCell"
                                                  owner:self
                                                options:nil];
    
    HomeItemCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
