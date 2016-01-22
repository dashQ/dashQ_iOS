//
//  WriteViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/21/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
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

+ (WriteViewController *)viewController;


@property (strong, nonatomic) WriteToolBarView *toolBarView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sections;

@property (strong, nonatomic) NSString *viewControllerTitle;

@end
