//
//  WriteToolBarView.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "WriteToolBarView.h"

@implementation WriteToolBarView

+ (WriteToolBarView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"WriteToolBarView"
                                                  owner:self
                                                options:nil];
    
    WriteToolBarView *view = [nibs objectAtIndex:0];
    
    return view;
}

- (void)awakeFromNib {

    self.topLineView.backgroundColor = DEFAULT_DASHQ_MAIN_COLOR;    
}

@end
