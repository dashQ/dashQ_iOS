//
//  RootNavigationController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/13/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeaderView.h"
#import "CommonGadgetView.h"
#import "CommonGadgetToolsView.h"

@interface RootNavigationController : UINavigationController <
CommonGadgetViewDelegate>

@property (strong, nonatomic) CommonGadgetToolsView *commonGadgetToolsView;
@property (strong, nonatomic) CommonGadgetView *commonGadgetView;
@property (strong, nonatomic) CommonHeaderView *commonHeaderView;


- (void)initCommonHeader;
- (void)initCommonGadget;

@end
