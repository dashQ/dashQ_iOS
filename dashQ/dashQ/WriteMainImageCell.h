//
//  WriteMainImageCell.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_HOOT_WRITE_MAIN_IMAGE_CELL 321.0f

@interface WriteMainImageCell : UITableViewCell

@property (assign, nonatomic) id delegate;

+ (WriteMainImageCell *)cell;

@property (assign, nonatomic) NSInteger rowIndex;

@property (weak, nonatomic) IBOutlet UITextField *mainTitleTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;

- (IBAction)addImageTouched:(id)sender;

@end

@protocol WriteMainImageCellDelegate <NSObject>

- (void)writeMainImageCellAddImageTouched:(WriteMainImageCell *)cell;

@end
