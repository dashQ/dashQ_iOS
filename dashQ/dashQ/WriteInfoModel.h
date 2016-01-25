//
//  WriteInfoModel.h
//  dashQ
//
//  Created by Hoyool Yoon on 1/24/16.
//  Copyright © 2016 dashQ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    WriteSubType
    ,WriteMainType
} WriteModelType;

@interface WriteInfoModel : NSObject

@property (assign, nonatomic) WriteModelType modelType;
@property (strong, nonatomic) NSString *writeTitle;
@property (strong, nonatomic) NSString *writeReview;
@property (strong, nonatomic) UIImage *writeImage;

@end
