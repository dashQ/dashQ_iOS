//
//  CustomInputView.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "CustomInputView.h"

@implementation CustomInputView

+ (CustomInputView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomInputView"
                                                  owner:self
                                                options:nil];
    
    CustomInputView *view = [nibs objectAtIndex:0];
    
    return view;
}

- (IBAction)doneTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate customInputViewDoneTouched:self];
    }
    
}


@end
