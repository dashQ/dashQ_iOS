//
//  MyReviewCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 2/7/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT_MY_REVIEW_CELL 250.0f

@interface MyReviewCell : UITableViewCell

+ (MyReviewCell *)cell;
@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *myReviewImageView;
@property (weak, nonatomic) IBOutlet UILabel *myReviewTitle;


@end
