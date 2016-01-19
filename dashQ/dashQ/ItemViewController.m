//
//  ItemViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/3/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "ItemViewController.h"

typedef enum {
    ItemMainTitleSection
    ,ItemSubSection
    ,ItemReferenceSection
} ItemSections;

@interface ItemViewController ()

@end

@implementation ItemViewController

+ (ItemViewController *)viewController {
    
    ItemViewController *itemViewController = [[ItemViewController alloc] initWithNibName:@"ItemViewController" bundle:nil];
    
    return itemViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self update];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update {
    
    NSMutableArray *sections = [NSMutableArray array];
    
    [sections addObject:@(ItemMainTitleSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    [sections addObject:@(ItemSubSection)];
    
    //[sections addObject:@(ItemReferenceSection)];
    
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (ItemSections)sectionIndex:(NSInteger)section {
    ItemSections sectionIndex = (ItemSections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ItemSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case ItemMainTitleSection: {
            
            ItemMainHeaderView *mainHeaderView = [ItemMainHeaderView view];
            mainHeaderView.mainLabel.text = @"How To Boil An Egg";
            
            return mainHeaderView;
            
        }
            
        case ItemSubSection: {
            
            ItemMainHeaderView *mainHeaderView = [ItemMainHeaderView view];
            NSString *textString = [NSString stringWithFormat:@"Step %ld", (long)section];
            mainHeaderView.mainLabel.text = textString;
            return mainHeaderView;

        }
            
        case ItemReferenceSection:
            return nil;
            
        default:
            break;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ItemSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case ItemMainTitleSection:
            return 1;
            
        case ItemSubSection:
            return 1;
            
        case ItemReferenceSection:
            return 1;
            
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case ItemMainTitleSection: {
            
            static NSString *identifier = @"ItemMainTitleCell";
            
            ItemMainTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [ItemMainTitleCell cell];
            }
            
            
            [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.finecooking.com/CMS/uploadedImages/Images/Cooking/Articles/Issues_81-90/fc83kt071-02_xlg.jpg"] placeholderImage:[UIImage imageNamed:@"Image_PlaceHolder" ]];
            
            return cell;
        }
            
        case ItemSubSection: {
    
            static NSString *identifier = @"ItemSubCell";
            
            ItemSubCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [ItemSubCell cell];
            }
            
            
            [cell.subImageView sd_setImageWithURL:[NSURL URLWithString:@"http://farm9.staticflickr.com/8070/8271067395_872a0f82d6_z.jpg"]];
            
            return cell;
        }
            
        case ItemReferenceSection: {
            
            static NSString *identifier = @"ItemSubCell";
            
            ItemSubCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [ItemSubCell cell];
            }
            return cell;
        }
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ItemSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case ItemMainTitleSection:
            return [self heightDynamicCell:HEIGHT_ITEM_MAIN_TITLE_CELL alpha375:12.0f alpha414:18.0f];
            
        case ItemSubSection:
            return [self heightDynamicCell:HEIGHT_ITEM_SUB_CELL alpha375:12.0f alpha414:18.0f];
            
        case ItemReferenceSection:
            return [self heightDynamicCell:HEIGHT_ITEM_MAIN_TITLE_CELL alpha375:12.0f alpha414:18.0f];
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case ItemMainTitleSection: {
            
            [self performSegueWithIdentifier:@"WriteViewControllerPush" sender:self];
            
        }
            break;
            
        case ItemSubSection: {
            
            [self performSegueWithIdentifier:@"HomeTableCellPush" sender:self];
            
        }
            break;
            
        case ItemReferenceSection: {
            
            [self performSegueWithIdentifier:@"HomeTableCellPush" sender:self];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@""]) {
        
    }
    
    
    
}

@end
