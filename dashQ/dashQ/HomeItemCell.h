//
//  HomeItemCell.h
//  Hoot
//
//  Created by Hoyool Yoon on 9/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_HOME_ITEM_CELL 142.0f

@interface HomeItemCell : UITableViewCell

+ (HomeItemCell *)cell;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@property (assign, nonatomic) id delegate;

@end
