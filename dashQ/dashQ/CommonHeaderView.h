//
//  CommonHeaderView.h
//  Hoot
//
//  Created by Hoyool Yoon on 9/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Views
#import "CommonSearchBarView.h"

//Input View
#import "CustomInputView.h"

@interface CommonHeaderView : UIView <
CustomInputViewDelegate>

@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingSearchButtonConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingSearchBarViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchBarViewWidthConstraint;

@property (weak, nonatomic) IBOutlet UIView *searchBarView;
@property (strong, nonatomic) CommonSearchBarView *commonSearchBarView;

+ (CommonHeaderView *)view;

- (IBAction)searchTouched:(UIButton *)sender;
- (IBAction)onBackTouched:(id)sender;

- (void)shrinkSearchBar;
- (void)expandSearchBar;

- (void)hideHeaderView:(BOOL)hide;
- (void)hideSearchButton:(BOOL)hide;
- (void)hideBackButton:(BOOL)hide;

@end

@protocol CommonHeaderViewDelegate <NSObject>

- (void)commonHeaderViewBackTouched:(CommonHeaderView *)view;

@end
