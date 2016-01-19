//
//  WriteViewController.m
//  Hoot
//
//  Created by Hoyool Yoon on 10/13/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "WriteViewController.h"

typedef enum {
    HootWriteTitleSection
    ,HootWriteMainImageSection
    ,HootWriteSubInfoSection
    ,HootWriteEmptySection
} HootWriteSections;

@interface WriteViewController ()

@end

@implementation WriteViewController

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
    [sections addObject:@(HootWriteTitleSection)];
    [sections addObject:@(HootWriteMainImageSection)];
    [sections addObject:@(HootWriteSubInfoSection)];
    
    [sections addObject:@(HootWriteEmptySection)];
    
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (HootWriteSections)sectionIndex:(NSInteger)section {
    HootWriteSections sectionIndex = (HootWriteSections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HootWriteSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case HootWriteTitleSection:
            return 1;
        case HootWriteMainImageSection:
            return 1;
        case HootWriteSubInfoSection:
            return 1;
        case HootWriteEmptySection:
            return 1;
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HootWriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case HootWriteTitleSection: {
            
            static NSString *identifier = @"CommonTitleCell";
            
            CommonTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [CommonTitleCell cell];
            }
            
            cell.titleLabel.text = self.viewControllerTitle;
            
            return cell;
        }
            
        case HootWriteMainImageSection: {
            
            static NSString *identifier = @"WriteMainImageCell";
            
            WriteMainImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [WriteMainImageCell cell];
                cell.delegate = self;
            }
            
            return cell;
        }
            
        case HootWriteSubInfoSection: {
            
            static NSString *identifier = @"WriteSubInfoCell";
            
            WriteSubInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [WriteSubInfoCell cell];
                cell.delegate = self;
            }
            
            return cell;
        }

        case HootWriteEmptySection: {
            
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
    
    
    HootWriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        
        case HootWriteTitleSection:
            return HEIGHT_HOOT_COMMON_TITLE_CELL;
            
        case HootWriteMainImageSection:
            
            return [self heightDynamicCell:HEIGHT_HOOT_WRITE_MAIN_IMAGE_CELL alpha375:12.0f alpha414:18.0f];
            
        case HootWriteSubInfoSection:
            return [self heightDynamicCell:HEIGHT_HOOT_WRITE_SUB_INFO_CELL alpha375:12.0f alpha414:18.0f];
            
        case HootWriteEmptySection:
            return HEIGHT_HOOT_COMMON_EMPTY_CELL;
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HootWriteSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case HootWriteMainImageSection: {
            
        }
            break;
            
        default:
            break;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Table Cell Delegate Methods

- (void)writeMainImageCellAddImageTouched:(WriteMainImageCell *)cell {
    
    ImagePickerViewController *imagePickerViewController = [ImagePickerViewController viewController];
    [self.navigationController pushViewController:imagePickerViewController animated:YES];
    
}

@end
