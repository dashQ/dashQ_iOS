//
//  SearchViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/19/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "SearchViewController.h"

typedef enum {
    
    SearchBarSection,
    SearchItemSection
    
}SearchSections;

@interface SearchViewController ()

@end

@implementation SearchViewController

+ (SearchViewController *)viewController {
    
    SearchViewController *searchViewController = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    
    return searchViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self update];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update {
    
    NSMutableArray *sections = [NSMutableArray array];
    
    [sections addObject:@(SearchItemSection)];
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (SearchSections)sectionIndex:(NSInteger)section {
    SearchSections sectionIndex = (SearchSections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SearchSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case SearchItemSection:
            return 10;
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case SearchItemSection: {
            
            static NSString *identifier = @"HootSearchItemCell";
            
            SearchItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [SearchItemCell cell];
                cell.delegate = self;
            }
            
            
            [cell.itemImageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.thelogomix.com/files/imagecache/v3-logo-detail/hoot.jpg"]];
            
            return cell;
        }
            
        default:
            break;
    }
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
       
        case SearchItemSection:
            return [self heightDynamicCell:HEIGHT_SEARCH_BAR_CELL alpha375:12.0f alpha414:18.0f];
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case SearchBarSection: {
            //[self performSegueWithIdentifier:@"HomeTableCellPush" sender:self];
        }
            break;
        case SearchItemSection: {
            //[self performSegueWithIdentifier:@"HomeTableCellPush" sender:self];
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

@end
