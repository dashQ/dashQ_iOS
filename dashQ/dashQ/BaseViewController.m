//
//  BaseViewController.m
//  dashQ
//
//  Created by Hoyool Yoon on 2/4/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Add CustomInputView
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


#pragma mark Call ImagePickerController
- (void)callImagePickerController {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}


@end
