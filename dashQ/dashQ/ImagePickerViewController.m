//
//  ImagePickerViewController.m
//  Hoot
//
//  Created by Hoyool Yoon on 11/14/15.
//  Copyright (c) 2015 Hoot Inc. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.takeButton setBackgroundImage:[UIImage resizableImage:@"common_btn_basic_n"] forState:UIControlStateNormal];
    [self.chooseButton setBackgroundImage:[UIImage resizableImage:@"common_btn_basic_n"] forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [RootNavigationController sharedInstance].commonHeaderView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [RootNavigationController sharedInstance].commonHeaderView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (ImagePickerViewController *)viewController {
    
    ImagePickerViewController *imagePickerViewController = [[ImagePickerViewController alloc] initWithNibName:@"ImagePickerViewController" bundle:nil];
    
    return imagePickerViewController;
}

- (IBAction)takePhotoTouched:(id)sender {
    
}

- (IBAction)choosePhotoTouched:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
