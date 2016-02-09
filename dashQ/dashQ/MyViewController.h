//
//  MyViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 2/4/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "BaseViewController.h"

//API Data
#import "MyDataModel.h"

//Cells
#import "MyEmptyCell.h"
#import "MyReviewCell.h"
#import "CommonTitleCell.h"


@interface MyViewController : BaseViewController <
    UITableViewDataSource
,   UITableViewDelegate>


+ (MyViewController *)viewController;

//TableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//API Data
@property (strong, nonatomic) NSMutableArray *myDataArray;

@end
