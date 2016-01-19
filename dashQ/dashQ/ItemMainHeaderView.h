//
//  ItemMainHeaderView.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/17/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemMainHeaderView : UIView

+ (ItemMainHeaderView *)view;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end
