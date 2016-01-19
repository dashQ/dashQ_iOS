//
//  ItemSubCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/16/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "ItemSubCell.h"

@implementation ItemSubCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (ItemSubCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ItemSubCell"
                                                  owner:self
                                                options:nil];
    
    ItemSubCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end