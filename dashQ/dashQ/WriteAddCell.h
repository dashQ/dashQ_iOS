//
//  WriteAddCell.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/28/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


#define HEIGHT_WRITE_ADD_CELL 65.0f

@interface WriteAddCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (assign, nonatomic) id delegate;

+ (WriteAddCell *)cell;

@end
