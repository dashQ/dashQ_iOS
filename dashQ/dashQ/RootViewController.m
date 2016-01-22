//
//  RootViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/22/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    //Add RootNavigationController as a child controller
    //Did this cuz storyboard doesnt let me use the shared instance as the storyboard controller
    
    [self addChildViewController:[RootNavigationController sharedInstance]];
    [RootNavigationController sharedInstance].view.frame = self.view.frame;
    [self.view addSubview:[RootNavigationController sharedInstance].view];
    [[RootNavigationController sharedInstance] didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
