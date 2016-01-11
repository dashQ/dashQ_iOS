//
//  CommonGadgetView.m
//  Hoot
//
//  Created by Hoyool Yoon on 9/20/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonGadgetView.h"

@implementation CommonGadgetView

- (IBAction)menuTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonGadgetViewMenuTouched:self];
    }
    
}

+ (CommonGadgetView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonGadgetView"
                                                  owner:self
                                                options:nil];
    
    CommonGadgetView *view = [nibs objectAtIndex:0];
    
    return view;
}

@end
