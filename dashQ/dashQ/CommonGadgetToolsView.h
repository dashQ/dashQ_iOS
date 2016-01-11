//
//  CommonGadgetToolsView.h
//  Hoot
//
//  Created by Hoyool Yoon on 10/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonGadgetToolsView : UIView

@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIButton *myHootButton;
@property (weak, nonatomic) IBOutlet UIButton *favouitesButton;
@property (weak, nonatomic) IBOutlet UIButton *writeButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXSettingsConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSettingsConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXFavouritesConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomFavouritesConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomWriteConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXWriteConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomMyHootConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXMyHootConstraint;

- (void)updateTools;
- (void)showAllTools;
- (void)hideAllTools;

- (IBAction)writeTouched:(id)sender;
- (IBAction)favouriteTouched:(id)sender;
- (IBAction)myHootTouched:(id)sender;
- (IBAction)settingsTouched:(id)sender;



+ (CommonGadgetToolsView *)view;

@end


@protocol CommonGadgetToolsViewDelegate <NSObject>

- (void)commonGadgetToolsViewWriteTouched:(CommonGadgetToolsView *)view;
- (void)commonGadgetToolsViewFavouritesTouched:(CommonGadgetToolsView *)view;
- (void)commonGadgetToolsViewMyHootTouched:(CommonGadgetToolsView *)view;
- (void)commonGadgetToolsViewSettingsTouched:(CommonGadgetToolsView *)view;

@end



