//
//  SearchItemCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_SEARCH_BAR_CELL 121.0f

@interface SearchItemCell : UITableViewCell

+ (SearchItemCell *)cell;

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (assign, nonatomic) id delegate;

@end
