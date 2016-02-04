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
#import "CommonLargeSpaceCell.h"
#import "WriteAddCell.h"

//ViewControllers
#import "ImagePickerViewController.h"
#import "BaseViewController.h"

//Models
#import "WriteInfoModel.h"

@interface WriteViewController : BaseViewController <
WriteMainImageCellDelegate
,WriteSubInfoCellDelegate
,UIImagePickerControllerDelegate
,UINavigationControllerDelegate>

+ (WriteViewController *)viewController;

@property (strong, nonatomic) WriteToolBarView *toolBarView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sections;

@property (strong, nonatomic) NSString *viewControllerTitle;

@property (assign, nonatomic) NSInteger selectedRowIndex;
@property (strong, nonatomic) NSMutableArray *writeModelArray;

@end


