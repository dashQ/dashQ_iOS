//
//  RootNavigationController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/13/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Common View
#import "CommonHeaderView.h"
#import "CommonGadgetView.h"
#import "CommonGadgetToolsView.h"

//ViewControllers
#import "WriteViewController.h"

@interface RootNavigationController : UINavigationController <
CommonGadgetViewDelegate>

+ (RootNavigationController *)sharedInstance;

@property (strong, nonatomic) CommonGadgetToolsView *commonGadgetToolsView;
@property (strong, nonatomic) CommonGadgetView *commonGadgetView;
@property (strong, nonatomic) CommonHeaderView *commonHeaderView;

- (void)hideSearchButton:(BOOL)hide;
- (void)hideBackButton:(BOOL)hide;
- (void)hideGadgetView:(BOOL)hide;
- (void)hideAllTools:(BOOL)hide;
- (void)hideGadgeToolsView:(BOOL)hide;

- (void)initCommonHeader;
- (void)initCommonGadget;

@end
