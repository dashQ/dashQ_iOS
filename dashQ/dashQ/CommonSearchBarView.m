//
//  CommonSearchBarView.m
//  Hoot
//
//  Created by Hoyool Yoon on 12/5/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonSearchBarView.h"

@implementation CommonSearchBarView

+ (CommonSearchBarView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonSearchBarView"
                                                  owner:self
                                                options:nil];
    
    CommonSearchBarView *view = [nibs objectAtIndex:0];
    
    return view;
}


@end
