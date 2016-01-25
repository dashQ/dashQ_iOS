//
//  CommonLargeSpaceCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/25/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "CommonLargeSpaceCell.h"

@implementation CommonLargeSpaceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CommonLargeSpaceCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonLargeSpaceCell"
                                                  owner:self
                                                options:nil];
    
    CommonLargeSpaceCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
