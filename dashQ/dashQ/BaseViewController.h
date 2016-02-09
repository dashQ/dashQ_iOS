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
,   UINavigationControllerDelegate>

//Sections
@property (strong, nonatomic) NSMutableArray *sections;

// Add CustomInputView
- (void)addCustomInputViewTextField:(UITextField *)textField;
- (void)addCustomInputViewTextView:(UITextView *)textView;

// CustomInputViewDelegate
- (void)customInputViewDoneTouched:(CustomInputView *)view;

// Call ImagePickerController
- (void)callImagePickerController;

//Send to ItemViewController
- (void)sendToItemViewController:(NSString *)itemNo;

@end
