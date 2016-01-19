//
//  CommonSearchBarView.h
//  Hoot
//
//  Created by Hoyool Yoon on 12/5/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonSearchBarView : UIView

@property (assign, nonatomic) id delegate;

+ (CommonSearchBarView *)view;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@protocol CommonSearchViewDelegate <NSObject>

- (void)textFieldBeginEditing:(CommonSearchBarView *)view;

@end