//
//  ItemMainTitleCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/16/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_ITEM_MAIN_TITLE_CELL 271.0f

@interface ItemMainTitleCell : UITableViewCell

+ (ItemMainTitleCell *)cell;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end
