//
//  WriteViewController.h
//  Hoot
//
//  Created by Hoyool Yoon on 10/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Views
#import "WriteToolBarView.h"

//Table Cells
#import "WriteMainImageCell.h"
#import "WriteSubInfoCell.h"
#import "CommonEmptyCell.h"

//ViewControllers
#import "ImagePickerViewController.h"

@interface WriteViewController : UIViewController <
WriteMainImageCellDelegate>

@property (strong, nonatomic) WriteToolBarView *toolBarView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sections;

@property (strong, nonatomic) NSString *viewControllerTitle;

@end
