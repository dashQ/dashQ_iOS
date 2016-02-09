//
//  ItemViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/3/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import "ItemSubCell.h"
#import "ItemMainTitleCell.h"

//Header Views
#import "ItemMainHeaderView.h"
#import "ItemSubHeaderView.h"


@interface ItemViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

+ (ItemViewController *)viewController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//Item Info
@property (strong, nonatomic) NSString *itemNo;

@end
