//
//  WriteSubInfoCell.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_WRITE_SUB_INFO_CELL 461.0f

@interface WriteSubInfoCell : UITableViewCell <
UITextViewDelegate>

@property (assign, nonatomic) id delegate;

+ (WriteSubInfoCell *)cell;

@property (assign, nonatomic) NSInteger rowIndex;

@property (weak, nonatomic) IBOutlet UIButton *subImageButton;
@property (weak, nonatomic) IBOutlet UITextField *subTextField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (weak, nonatomic) IBOutlet UITextView *subTextView;
@property (weak, nonatomic) IBOutlet UIImageView *textBackgroundImageView;

- (IBAction)addImageTouched:(id)sender;

@end

@protocol WriteSubInfoCellDelegate <NSObject>

- (void)writeSubInfoCellAddImageTouched:(WriteSubInfoCell *)cell;

@end