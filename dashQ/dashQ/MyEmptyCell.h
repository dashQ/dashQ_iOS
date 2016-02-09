//
//  MyEmptyCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 2/7/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_MY_EMPTY_CELL 200.0f

@interface MyEmptyCell : UITableViewCell

+ (MyEmptyCell *)cell;
@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
