//
//  ItemSubCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/16/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_ITEM_SUB_CELL 321.0f

@interface ItemSubCell : UITableViewCell

+ (ItemSubCell *)cell;

@property (weak, nonatomic) IBOutlet UIImageView *subImageView;
@property (weak, nonatomic) IBOutlet UILabel *subInfoLabel;


@end
