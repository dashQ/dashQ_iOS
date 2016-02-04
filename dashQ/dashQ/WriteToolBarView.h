//
//  WriteToolBarView.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/15/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteToolBarView : UIView

@property (assign, nonatomic) id delegate;

+ (WriteToolBarView *)view;

@property (weak, nonatomic) IBOutlet UIView *topLineView;
@end
