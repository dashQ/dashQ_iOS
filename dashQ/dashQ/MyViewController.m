//
//  MyViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 2/4/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "MyViewController.h"

typedef enum {
    MyTitleSection
    ,MyReviewSection
    ,MyEmptySection
} MySections;

@interface MyViewController ()

@end

@implementation MyViewController

+ (MyViewController *)viewController {
    
    MyViewController *viewController = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
    
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initAPITestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Test Code
- (void)initAPITestData {
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    MyDataModel *myDataModel1 = [[MyDataModel alloc] init];
    MyDataModel *myDataModel2 = [[MyDataModel alloc] init];
    MyDataModel *myDataModel3 = [[MyDataModel alloc] init];
    
    myDataModel1.myReviewImageUrl = @"http://vignette3.wikia.nocookie.net/cookingmama/images/4/4a/Boiled_eggs.png";
    myDataModel1.myReviewTitle = @"TEST 1";
    myDataModel1.dateCreated = @"2016-01-01";
    
    myDataModel2.myReviewImageUrl = @"http://www.craftsy.com/blog/wp-content/uploads/2013/05/Screen-Shot-2013-05-28-at-12.52.37-PM.png";
    myDataModel2.myReviewTitle = @"TEST 2";
    myDataModel2.dateCreated = @"2016-01-01";
    
    myDataModel3.myReviewImageUrl = @"https://eatlivepaleo.files.wordpress.com/2013/01/perfect-boiled-eggs.png";
    myDataModel3.myReviewTitle = @"TEST 3";
    myDataModel3.dateCreated = @"2016-01-01";
    
    [dataArray addObject:myDataModel1];
    [dataArray addObject:myDataModel2];
    [dataArray addObject:myDataModel3];
    
    self.myDataArray = dataArray;
    
    [self update];
    
}

- (void)update {
    
    NSMutableArray *sections = [NSMutableArray array];
    
    [sections addObject:@(MyTitleSection)];
    
    if (self.myDataArray.count > 0) {
        [sections addObject:@(MyReviewSection)];
    }
    else {
        [sections addObject:@(MyEmptySection)];
    }
    
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (MySections)sectionIndex:(NSInteger)section {
    MySections sectionIndex = (MySections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    MySections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case MyTitleSection:
            return 1;
        case MyReviewSection: {
            return self.myDataArray.count;
        }
        case MyEmptySection:
            return 1;
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MySections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case MyTitleSection: {
            
            static NSString *identifier = @"CommonTitleCell";
            
            CommonTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [CommonTitleCell cell];
            }
            
            cell.titleLabel.text = @"My Reviews";
            
            return cell;
        }

        case MyReviewSection: {
            
            static NSString *identifier = @"MyReviewCell";
            
            MyReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [MyReviewCell cell];
                cell.delegate = self;
            }
            
            MyDataModel *myDataModel = [self.myDataArray objectAtIndex:indexPath.row];
            
            [cell.myReviewImageView sd_setImageWithURL:[NSURL URLWithString:myDataModel.myReviewImageUrl]];
            
            return cell;
        }
            
        case MyEmptySection: {
            
            static NSString *identifier = @"MyEmptyCell";
            
            MyEmptyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [MyEmptyCell cell];
                cell.delegate = self;
            }
            
            return cell;
        }
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MySections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
            
        case MyTitleSection:
            return HEIGHT_COMMON_TITLE_CELL;
            
        case MyReviewSection:
            return [self heightDynamicCell:HEIGHT_MY_REVIEW_CELL alpha375:0.0f alpha414:0.0f];
            
        case MyEmptySection:
            return HEIGHT_MY_EMPTY_CELL;
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MySections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case MyReviewSection: {
            
        }
            break;
            
        
        default:
            break;
    }
}


@end
