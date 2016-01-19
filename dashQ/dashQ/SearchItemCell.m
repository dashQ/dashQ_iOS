//
//  SearchItemCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "SearchItemCell.h"

@implementation SearchItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (SearchItemCell *)cell {
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"SearchItemCell"
                                                  owner:self
                                                options:nil];
    
    SearchItemCell *cell = [nibs objectAtIndex:0];
    
    return cell;

    
}

@end
