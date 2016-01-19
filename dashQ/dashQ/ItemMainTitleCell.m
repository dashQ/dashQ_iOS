//
//  ItemMainTitleCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/16/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "ItemMainTitleCell.h"

@implementation ItemMainTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (ItemMainTitleCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ItemMainTitleCell"
                                                  owner:self
                                                options:nil];
    
    ItemMainTitleCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}
@end
