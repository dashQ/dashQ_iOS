//
//  HomeViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/3/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (assign, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
