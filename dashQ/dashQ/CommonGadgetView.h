//
//  CommonGadgetView.h
//  Hoot
//
//  Created by Hoyool Yoon on 9/20/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonGadgetView : UIView

@property (assign, nonatomic) id delegate;

- (IBAction)menuTouched:(id)sender;

+ (CommonGadgetView *)view;
@end

@protocol CommonGadgetViewDelegate <NSObject>

- (void)commonGadgetViewMenuTouched:(CommonGadgetView *)view;

@end