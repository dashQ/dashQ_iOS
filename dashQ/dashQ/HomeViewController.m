//
//  HomeViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 1/3/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "HomeViewController.h"

typedef enum {
    HomeItemSection
} HomeSections;

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self update];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [[RootNavigationController sharedInstance] hideGadgetView:NO];
    [[RootNavigationController sharedInstance] hideBackButton:YES];    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [[RootNavigationController sharedInstance] hideBackButton:NO];
    [[RootNavigationController sharedInstance] hideAllTools:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [[RootNavigationController sharedInstance] hideGadgetView:YES];
    [[RootNavigationController sharedInstance] hideGadgeToolsView:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update {
    
    NSMutableArray *sections = [NSMutableArray array];
    
    [sections addObject:@(HomeItemSection)];
    self.sections = sections;
    
    [self.tableView reloadData];
    
}

- (HomeSections)sectionIndex:(NSInteger)section {
    HomeSections sectionIndex = (HomeSections)[[self.sections objectAtIndex:section] integerValue];
    return sectionIndex;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HomeSections sectionIndex = [self sectionIndex:section];
    
    switch (sectionIndex) {
        case HomeItemSection:
            return 10;
        default:
            break;
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case HomeItemSection: {
            
            static NSString *identifier = @"HomeItemCell";
            
            HomeItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [HomeItemCell cell];
                cell.delegate = self;
            }
            
            
            [cell.itemImageView sd_setImageWithURL:[NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/b/b5/800x600_Wallpaper_Blue_Sky.png"]];
            
            //            [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:@"http://i.ebayimg.com/00/s/ODAwWDgwMA==/z/MgkAAOSwPcVVqH4J/$_35.JPG"]
            //                                                                options:0
            //                                                               progress:nil
            //                                                              completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
            //             {
            //
            //             }];
            
            return cell;
        }
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    HomeSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case HomeItemSection:
            
            return [self heightDynamicCell:HEIGHT_HOME_ITEM_CELL alpha375:12.0f alpha414:18.0f];
            
        default:
            break;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeSections sectionIndex = [self sectionIndex:indexPath.section];
    
    switch (sectionIndex) {
        case HomeItemSection: {
            
            [self sendToItemViewController];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"WriteViewControllerPush"]) {
        
        WriteViewController *vc = [segue destinationViewController];
        vc.viewControllerTitle = @"Write How-To";
        
    }
}

- (void)sendToItemViewController {
    
    ItemViewController *itemViewController = [ItemViewController viewController];
    [self.navigationController pushViewController:itemViewController animated:YES];
    
}

@end
