//
//  HomeViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/3/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewControllers
#import "ItemViewController.h"
#import "WriteViewController.h"

//Table Cells
#import "HomeItemCell.h"

@interface HomeViewController : UIViewController <
  UITableViewDelegate
, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RootNavigationController *rootNavigationController;
@property (strong, nonatomic) NSMutableArray *sections;

@end
