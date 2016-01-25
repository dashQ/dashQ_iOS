//
//  WriteSubInfoCell.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "WriteSubInfoCell.h"

@implementation WriteSubInfoCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundImageView.image = [UIImage resizableImage:@"common_card_group"];
    self.textBackgroundImageView.image = [UIImage resizableImage:@"common_card_group"];
    self.subTextView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (WriteSubInfoCell *)cell {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"WriteSubInfoCell"
                                                  owner:self
                                                options:nil];
    
    WriteSubInfoCell *cell = [nibs objectAtIndex:0];
    
    return cell;
}

- (void)textViewDidBeginEditing:(UITextView *)textView; {
    textView.text = @"";
}


- (IBAction)addImageTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate writeSubInfoCellAddImageTouched:self];
    }
}

@end
