//
//  ImagePickerViewController.h
//  Hoot
//
//  Created by Hoyool Yoon on 11/14/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePickerViewController : UIViewController <
UIImagePickerControllerDelegate
, UINavigationControllerDelegate>

+ (ImagePickerViewController *)viewController;

- (IBAction)takePhotoTouched:(id)sender;
- (IBAction)choosePhotoTouched:(id)sender;
- (IBAction)closeTouched:(id)sender;
- (IBAction)saveImageTouched:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *takeButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseButton;


@end
