//
//  BaseViewController.h
//  dashQ
//
//  Created by Hoyool Yoon on 2/4/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <
UIImagePickerControllerDelegate
,UINavigationControllerDelegate>

// Add CustomInputView
- (void)addCustomInputViewTextField:(UITextField *)textField;
- (void)addCustomInputViewTextView:(UITextView *)textView;

// CustomInputViewDelegate
- (void)customInputViewDoneTouched:(CustomInputView *)view;

// Call ImagePickerController
- (void)callImagePickerController;

@end
