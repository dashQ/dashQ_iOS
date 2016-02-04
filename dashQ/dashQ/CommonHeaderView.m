//
//  CommonHeaderView.m
//  Hoot
//
//  Created by Hoyool Yoon on 9/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonHeaderView.h"

@implementation CommonHeaderView

+ (CommonHeaderView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonHeaderView"
                                                  owner:self
                                                options:nil];
    
    CommonHeaderView *view = [nibs objectAtIndex:0];
    
    return view;
}

- (void)awakeFromNib {
    
    CommonSearchBarView *searchBarView = [CommonSearchBarView view];
    searchBarView.delegate = self;
    
    CustomInputView *customInputView = [CustomInputView view];
    customInputView.delegate = self;
    
    [searchBarView.searchTextField setInputAccessoryView:customInputView];
    
    self.commonSearchBarView = searchBarView;
    
    [self.searchBarView addSubview:searchBarView];
    
    self.commonSearchBarView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.searchBarView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[searchBarView]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(searchBarView)]];
    
    [self.searchBarView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[searchBarView]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(searchBarView)]];
    
    self.searchBarView.alpha = 0.0f;

    
}

- (IBAction)searchTouched:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [self expandSearchBar];
    }
    else {
        [self shrinkSearchBar];
    }
    
}

- (IBAction)onBackTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonHeaderViewBackTouched:self];
    }
}

- (void)shrinkSearchBar {
    
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.searchBarViewWidthConstraint.constant = 0.0f;
                         
                         self.searchBarView.alpha = 0.0f;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                         
                     }
                     completion:^(BOOL finished){
                         self.searchButton.selected = NO;
                     }];
    
}

- (void)expandSearchBar {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         CGSize screenSize = [UIScreen mainScreen].bounds.size;
                         CGFloat screenWidth = screenSize.width;
                         
                         CGFloat leadingConstant = screenWidth - 60.0f - 40.0f;
                         
                         self.searchBarViewWidthConstraint.constant = leadingConstant;
                         
                         self.searchBarView.alpha = 1.0f;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                         
                     }
                     completion:^(BOOL finished){
                         self.searchButton.selected = YES;
                     }];
    
}

- (void)hideBackButton:(BOOL)hide {
    self.backButton.hidden = hide;
}

- (void)hideSearchButton:(BOOL)hide {
    self.searchButton.hidden = hide;
}

- (void)hideHeaderView:(BOOL)hide {
    self.hidden = hide;
}


#pragma mark CustomInputViewDelegate
- (void)customInputViewDoneTouched:(CustomInputView *)view {
    [self endEditing:YES];
    
    self.searchButton.selected = !self.searchButton.selected;
    [self shrinkSearchBar];
}

@end
