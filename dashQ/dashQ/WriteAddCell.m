//
//  WriteAddCell.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/28/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "WriteAddCell.h"

@implementation WriteAddCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundImageView.image = [UIImage resizableImage:@"common_card_group"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (WriteAddCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"WriteAddCell"
                                                  owner:self
                                                options:nil];
    
    WriteAddCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

@end
