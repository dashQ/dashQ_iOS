//
//  CommonTitleCell.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_COMMON_TITLE_CELL 45.0f

@interface CommonTitleCell : UITableViewCell

+ (CommonTitleCell *)cell;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
