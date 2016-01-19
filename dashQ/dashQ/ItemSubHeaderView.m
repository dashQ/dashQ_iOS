//
//  ItemSubHeaderView.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/17/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "ItemSubHeaderView.h"

@implementation ItemSubHeaderView

+ (ItemSubHeaderView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ItemSubHeaderView"
                                                  owner:self
                                                options:nil];
    
    ItemSubHeaderView *view = [nibs objectAtIndex:0];
    
    return view;
}

@end
