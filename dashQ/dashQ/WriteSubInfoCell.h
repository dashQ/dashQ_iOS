//
//  WriteSubInfoCell.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_HOOT_WRITE_SUB_INFO_CELL 461.0f

@interface WriteSubInfoCell : UITableViewCell <
UITextViewDelegate>

@property (assign, nonatomic) id delegate;

+ (WriteSubInfoCell *)cell;


@property (weak, nonatomic) IBOutlet UIButton *subImageButton;
@property (weak, nonatomic) IBOutlet UITextField *subTextField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UITextView *subTextView;
@property (weak, nonatomic) IBOutlet UIImageView *textBackgroundImageView;

@end
