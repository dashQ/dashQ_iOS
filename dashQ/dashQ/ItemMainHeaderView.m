//
//  ItemMainHeaderView.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/17/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "ItemMainHeaderView.h"

@implementation ItemMainHeaderView

+ (ItemMainHeaderView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ItemMainHeaderView"
                                                  owner:self
                                                options:nil];
    
    ItemMainHeaderView *view = [nibs objectAtIndex:0];
    
    return view;
}

@end
