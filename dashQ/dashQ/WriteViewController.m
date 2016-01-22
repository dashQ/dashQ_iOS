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
    ,WriteMainImageSection
    ,WriteSubInfoSection
    ,WriteEmptySection
} WriteSections;

@interface WriteViewController ()

@end

@implementation WriteViewController

+ (WriteViewController *)viewController {
    
    WriteViewController *viewController = [[WriteViewController alloc] initWithNibName:@"WriteViewController" bundle:nil];
    
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self update];
    [self initToolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [sections addObject:@(WriteMainImageSection)];
    [sections addObject:@(WriteSubInfoSection)];
    
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
        case WriteMainImageSection:
            return 1;
        case WriteSubInfoSection:
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
            
        case WriteMainImageSection: {
            
            static NSString *identifier = @"WriteMainImageCell";
            
            WriteMainImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [WriteMainImageCell cell];
                cell.delegate = self;
                [self addCustomInputViewTextField:cell.mainTitleTextLabel];
            }
            
            return cell;
        }
            
        case WriteSubInfoSection: {
            
            static NSString *identifier = @"WriteSubInfoCell";
            
            WriteSubInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [WriteSubInfoCell cell];
                cell.delegate = self;
                [self addCustomInputViewTextField:cell.subTextField];
                [self addCustomInputViewTextView:cell.subTextView];
            }
            
            return cell;
        }
            
        case WriteEmptySection: {
            
            static NSString *identifier = @"CommonEmptyCell";
            
            CommonEmptyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [CommonEmptyCell cell];
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
            return HEIGHT_HOOT_COMMON_TITLE_CELL;
            
        case WriteMainImageSection:
            return [self heightDynamicCell:HEIGHT_HOOT_WRITE_MAIN_IMAGE_CELL alpha375:12.0f alpha414:18.0f];
            
        case WriteSubInfoSection:
            return [self heightDynamicCell:HEIGHT_HOOT_WRITE_SUB_INFO_CELL alpha375:12.0f alpha414:18.0f];
            
        case WriteEmptySection:
            return HEIGHT_HOOT_COMMON_EMPTY_CELL;
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case WriteMainImageSection: {
            
        }
            break;
            
        default:
            break;
    }
}

- (void)addCustomInputViewTextField:(UITextField *)textField {
    
    CustomInputView *customInputView = [CustomInputView view];
    customInputView.searchButton.hidden = YES;
    customInputView.delegate = self;
    
    [textField setInputAccessoryView:customInputView];
}

- (void)addCustomInputViewTextView:(UITextView *)textView {
    
    CustomInputView *customInputView = [CustomInputView view];
    customInputView.searchButton.hidden = YES;
    customInputView.delegate = self;
    
    [textView setInputAccessoryView:customInputView];
}

#pragma mark CustomInputViewDelegate
- (void)customInputViewDoneTouched:(CustomInputView *)view {
    [self.view endEditing:YES];
}

#pragma mark Table Cell Delegate Methods

- (void)writeMainImageCellAddImageTouched:(WriteMainImageCell *)cell {
    
    ImagePickerViewController *imagePickerViewController = [ImagePickerViewController viewController];
    [self presentViewController:imagePickerViewController animated:YES completion:nil];
    
}

@end
