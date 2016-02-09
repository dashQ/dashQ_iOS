//
//  MyEmptyCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 2/7/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "MyEmptyCell.h"

@implementation MyEmptyCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundImageView.image = [UIImage resizableImage:@"common_card_group"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MyEmptyCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"MyEmptyCell"
                                                  owner:self
                                                options:nil];
    
    MyEmptyCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
