//
//  RootNavigationController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/13/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

+ (RootNavigationController *)sharedInstance {
    
    static RootNavigationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RootNavigationController viewController];
    });
    return sharedInstance;
}

+ (RootNavigationController *)viewController {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootNavigationController *rootViewController = [sb instantiateViewControllerWithIdentifier:@"rootNavigationController"];
    
    return rootViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCommonHeader];
    [self initCommonGadgetTools];
    [self initCommonGadget];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCommonHeader {
    
    CommonHeaderView *view = [CommonHeaderView view];
    view.delegate = self;
    [self.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[view]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view(60)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    self.commonHeaderView = view;
    
}

- (void)initCommonGadget {
    
    CommonGadgetView *view = [CommonGadgetView view];
    view.delegate = self;
    [self.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view(30)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[view(46)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view.superview
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f constant:0.0f]];
    
    self.commonGadgetView = view;
    
}

- (void)initCommonGadgetTools {
    
    CommonGadgetToolsView *view = [CommonGadgetToolsView view];
    view.delegate = self;
    [self.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view(150)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[view(260)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view.superview
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f constant:0.0f]];
    
    self.commonGadgetToolsView = view;
    
}

- (void)hideSearchButton:(BOOL)hide {
    [self.commonHeaderView hideSearchButton:hide];
}

- (void)hideBackButton:(BOOL)hide {
    [self.commonHeaderView hideBackButton:hide];
}

- (void)hideGadgetView:(BOOL)hide {
    [self.commonGadgetView setHidden:hide];
}

- (void)hideAllTools:(BOOL)hide {
    [self.commonGadgetToolsView hideAllTools];
}

- (void)hideGadgeToolsView:(BOOL)hide {
    [self.commonGadgetToolsView setHidden:hide];
}


- (void)commonHeaderViewBackTouched:(CommonHeaderView *)view {
    [self popViewControllerAnimated:YES];
}

- (void)sendToWriteViewController {
    
    WriteViewController *writeViewController = [WriteViewController viewController];
    [self pushViewController:writeViewController animated:YES];
}

#pragma mark - Delegate Methods

#pragma mark - CommonGadgetView Delegate Methods

- (void)commonGadgetViewMenuTouched:(CommonGadgetView *)view {
    [self.commonGadgetToolsView updateTools];
}

#pragma mark - CommonGadgetToolsView Delegate Methods

- (void)commonGadgetToolsViewWriteTouched:(CommonGadgetToolsView *)view {
    
    [self sendToWriteViewController];
}

- (void)commonGadgetToolsViewFavouritesTouched:(CommonGadgetToolsView *)view {
    
}

- (void)commonGadgetToolsViewMyHootTouched:(CommonGadgetToolsView *)view {
    
}

- (void)commonGadgetToolsViewSettingsTouched:(CommonGadgetToolsView *)view {
    
}




@end
