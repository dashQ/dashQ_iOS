//
//  CommonGadgetToolsView.m
//  Hoot
//
//  Created by Hoyool Yoon on 10/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "CommonGadgetToolsView.h"

@implementation CommonGadgetToolsView

+ (CommonGadgetToolsView *)view {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CommonGadgetToolsView"
                                                  owner:self
                                                options:nil];
    
    CommonGadgetToolsView *view = [nibs objectAtIndex:0];
    
    return view;
}


- (void)updateTools {
    
    if (self.hidden) {
        [self showAllTools];
    }
    else {
        [self hideAllTools];
    }
}

- (void)showAllTools {
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                     
                         self.centerXWriteConstraint.constant = 100.0f;
                         self.bottomWriteConstraint.constant = 50.0f;
                         
                         self.centerXFavouritesConstraint.constant = 50.0f;
                         self.bottomFavouritesConstraint.constant = 100.0f;
                         
                         self.centerXMyHootConstraint.constant = -50.0f;
                         self.bottomMyHootConstraint.constant = 100.0f;
                         
                         self.centerXSettingsConstraint.constant = -100.0f;
                         self.bottomSettingsConstraint.constant = 50.0f;
                         
                         self.writeButton.alpha = 1.0f;
                         self.favouitesButton.alpha = 1.0f;
                         self.myHootButton.alpha = 1.0f;
                         self.settingsButton.alpha = 1.0f;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                     
                     }
                     completion:nil];
    
    
}

- (void)hideAllTools {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.centerXWriteConstraint.constant = 0.0f;
                         self.bottomWriteConstraint.constant = 0.0f;
                         
                         self.centerXFavouritesConstraint.constant = 0.0f;
                         self.bottomFavouritesConstraint.constant = 0.0f;
                         
                         self.centerXMyHootConstraint.constant = 0.0f;
                         self.bottomMyHootConstraint.constant = 0.0f;
                         
                         self.centerXSettingsConstraint.constant = 0.0f;
                         self.bottomSettingsConstraint.constant = 0.0f;
                         
                         self.writeButton.alpha = 0.0f;
                         self.favouitesButton.alpha = 0.0f;
                         self.myHootButton.alpha = 0.0f;
                         self.settingsButton.alpha = 0.0f;
                         
                         [self setNeedsDisplay];
                         [self layoutIfNeeded];
                         
                     }
                     completion:^(BOOL finished){
                     
                         self.hidden = YES;
                         
                     }];
    
    
}

- (IBAction)writeTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonGadgetToolsViewWriteTouched:self];
    }

}

- (IBAction)favouriteTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonGadgetToolsViewFavouritesTouched:self];
    }
}

- (IBAction)myHootTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonGadgetToolsViewMyHootTouched:self];
    }
}

- (IBAction)settingsTouched:(id)sender {
    
    if (self.delegate) {
        [self.delegate commonGadgetToolsViewSettingsTouched:self];
    }
}

@end
