//
//  WriteViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/21/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "WriteViewController.h"

typedef enum {
    WriteTitleSection
    ,WriteReviewSection
    ,WriteAddSection
    ,WriteEmptySection
} WriteSections;

@interface WriteViewController ()

@end

@implementation WriteViewController

+ (WriteViewController *)viewController {
    
    WriteViewController *viewController = [[WriteViewController alloc] initWithNibName:@"WriteViewController" bundle:nil];
    
    return viewController;
}

- (void)viewWillAppear:(BOOL)animated {
    [[RootNavigationController sharedInstance] hideSearchButton:YES];
    [[RootNavigationController sharedInstance] hideBackButton:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[RootNavigationController sharedInstance] hideSearchButton:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initTestWriteDataArray];
    [self initToolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTestWriteDataArray {
    
    self.writeModelArray = [NSMutableArray array];
    
    WriteInfoModel *writeMainModel = [[WriteInfoModel alloc] init];
    writeMainModel.modelType = WriteMainType;
    
    WriteInfoModel *writeSubModel = [[WriteInfoModel alloc] init];
    writeSubModel.modelType = WriteSubType;
    
    [self.writeModelArray addObject:writeMainModel];
    [self.writeModelArray addObject:writeSubModel];
    
    [self update];
}

- (void)initToolBar {
    
    WriteToolBarView *view = [WriteToolBarView view];
    view.delegate = self;
    [self.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view]-0-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[view(50)]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(view)]];
    
    self.toolBarView = view;
    
}

- (void)update {
    
    NSMutableArray *sections = [NSMutableArray array];
    [sections addObject:@(WriteTitleSection)];
    [sections addObject:@(WriteReviewSection)];
    [sections addObject:@(WriteAddSection)];
    [sections addObject:@(WriteEmptySection)];
    
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (WriteSections)sectionIndex:(NSInteger)section {
    WriteSections sectionIndex = (WriteSections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    WriteSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case WriteTitleSection:
            return 1;
        case WriteReviewSection: {
            return self.writeModelArray.count;
        }
        case WriteAddSection:
            return 1;
        case WriteEmptySection:
            return 1;
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case WriteTitleSection: {
            
            static NSString *identifier = @"CommonTitleCell";
            
            CommonTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [CommonTitleCell cell];
            }
            
            cell.titleLabel.text = self.viewControllerTitle;
            
            return cell;
        }
            
        case WriteReviewSection: {
            
            NSInteger rowIndex = indexPath.row;
            WriteInfoModel *writeModel = [self.writeModelArray objectAtIndex:rowIndex];
            
            if (writeModel.modelType == WriteMainType) {
            
                static NSString *identifier = @"WriteMainImageCell";
            
                WriteMainImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
                if (!cell) {
                    cell = [WriteMainImageCell cell];
                    cell.delegate = self;
                    [self addCustomInputViewTextField:cell.mainTitleTextLabel];
                }
                
                cell.rowIndex = rowIndex;
            
                if (writeModel.writeImage) {
                    cell.selectedImageView.image = writeModel.writeImage;
                    [cell.addImageButton setTitle:@"" forState:UIControlStateNormal];
                }
                else {
                    [cell.addImageButton setTitle:@"+" forState:UIControlStateNormal];
                    cell.selectedImageView.image = nil;
                }
                
                return cell;
            }
            
            else if (writeModel.modelType == WriteSubType) {
            
                static NSString *identifier = @"WriteSubInfoCell";
            
                WriteSubInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
                if (!cell) {
                    cell = [WriteSubInfoCell cell];
                    cell.delegate = self;
                    [self addCustomInputViewTextField:cell.subTextField];
                    [self addCustomInputViewTextView:cell.subTextView];
                }
            
                cell.rowIndex = rowIndex;
                
                if (writeModel.writeImage) {
                    cell.selectedImageView.image = writeModel.writeImage;
                    [cell.subImageButton setTitle:@"" forState:UIControlStateNormal];
                }
                else {
                    [cell.subImageButton setTitle:@"+" forState:UIControlStateNormal];
                    cell.selectedImageView.image = nil;
                }
                
                return cell;
            }
        }
        case WriteAddSection: {
            
            static NSString *identifier = @"WriteAddCell";
            
            WriteAddCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [WriteAddCell cell];
                cell.delegate = self;
            }
            
            return cell;
        }
            
        case WriteEmptySection: {
            
            static NSString *identifier = @"CommonLargeSpaceCell";
            
            CommonLargeSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [CommonLargeSpaceCell cell];
            }
            
            return cell;
        }
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    WriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
            
        case WriteTitleSection:
            return HEIGHT_COMMON_TITLE_CELL;
            
        case WriteReviewSection: {
            
            WriteInfoModel *writeModel = [self.writeModelArray objectAtIndex:indexPath.row];
            
            if (writeModel.modelType == WriteMainType) {
                return [self heightDynamicCell:HEIGHT_WRITE_MAIN_IMAGE_CELL alpha375:12.0f alpha414:18.0f];
            }
            else if (writeModel.modelType == WriteSubType) {
                return [self heightDynamicCell:HEIGHT_WRITE_SUB_INFO_CELL alpha375:12.0f alpha414:18.0f];
            }
        }
            
        case WriteAddSection:
            return HEIGHT_WRITE_ADD_CELL;
            
        case WriteEmptySection:
            return HEIGHT_COMMON_LARGE_SPACE_CELL;
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case WriteReviewSection: {
            
        }
            break;
            
        case WriteAddSection: {
            [self addReview];
        }
            break;
            
        default:
            break;
    }
}

- (void)addReview {
    
    WriteInfoModel *writeSubModel = [[WriteInfoModel alloc] init];
    writeSubModel.modelType = WriteSubType;
    
    [self.writeModelArray addObject:writeSubModel];
    
    [self.tableView reloadData];

}


#pragma mark WriteMainImageCell Delegate Methods

- (void)writeMainImageCellAddImageTouched:(WriteMainImageCell *)cell {
    
    self.selectedRowIndex = cell.rowIndex;
    [self callImagePickerController];
}

#pragma mark WriteSubInfoCell Delegate Methods

- (void)writeSubInfoCellAddImageTouched:(WriteSubInfoCell *)cell {
    
    self.selectedRowIndex = cell.rowIndex;
    [self callImagePickerController];
}

- (void)addSelectedImageToArray:(NSInteger)rowIndex selectedImage:(UIImage *)selectedImage {
    
    if (self.writeModelArray.count > rowIndex) {
        
        WriteInfoModel *writeModel = [self.writeModelArray objectAtIndex:rowIndex];
        writeModel.writeImage = selectedImage;
    }
}


#pragma mark UIImagePickerController Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self addSelectedImageToArray:self.selectedRowIndex selectedImage:chosenImage];
    
    [self.tableView reloadData];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
