//
//  SearchViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Cells
#import "SearchItemCell.h"

@interface SearchViewController : UIViewController <
UITableViewDelegate,
UITableViewDataSource>

+ (SearchViewController *)viewController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sections;
@end
