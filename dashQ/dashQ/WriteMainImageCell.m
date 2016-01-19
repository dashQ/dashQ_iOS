//
//  WriteMainImageCell.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "WriteMainImageCell.h"

@implementation WriteMainImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (WriteMainImageCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"WriteMainImageCell"
                                                  owner:self
                                                options:nil];
    
    WriteMainImageCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

- (IBAction)addImageTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate writeMainImageCellAddImageTouched:self];
    }
}
@end
