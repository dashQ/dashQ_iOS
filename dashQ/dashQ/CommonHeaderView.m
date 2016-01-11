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
    
    [self.searchBarView addSubview:searchBarView];
    
    searchBarView.translatesAutoresizingMaskIntoConstraints = NO;
    
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
    
    self.searchBarView.hidden = YES;


    
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
    
    self.searchBarView.hidden = YES;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.searchBarViewWidthConstraint.constant = 0.0f;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                         
                     }
                     completion:nil];
    
}

- (void)expandSearchBar {
    
    self.searchBarView.hidden = NO;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         CGSize screenSize = [UIScreen mainScreen].bounds.size;
                         CGFloat screenWidth = screenSize.width;
                         
                         CGFloat leadingConstant = screenWidth - 60.0f - 40.0f;
                         
                         self.searchBarViewWidthConstraint.constant = leadingConstant;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                         
                     }
                     completion:nil];
    
}

- (void)hideBackButton {
    self.backButton.hidden = YES;
}

- (void)showBackButton {
    self.backButton.hidden = NO;
}

- (void)hideSearchButton {
    self.searchButton.hidden = YES;
}

- (void)showSearchButton {
    self.searchButton.hidden = NO;
}

- (void)hideHeaderView {
    self.hidden = YES;
}

- (void)showHeaderView {
    self.hidden = NO;
}

@end
