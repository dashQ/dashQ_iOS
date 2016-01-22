//
//  CustomInputView.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomInputView : UIView

+ (CustomInputView *)view;

@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)closeTouched:(id)sender;
- (IBAction)searchTouched:(id)sender;


@end

@protocol CustomInputViewDelegate <NSObject>

- (void)customInputViewDoneTouched:(CustomInputView *)view;

@end