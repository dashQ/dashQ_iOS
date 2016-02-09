//
//  MyReviewCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 2/7/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "MyReviewCell.h"

@implementation MyReviewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundImageView.image = [UIImage resizableImage:@"common_card_group"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MyReviewCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"MyReviewCell"
                                                  owner:self
                                                options:nil];
    
    MyReviewCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
