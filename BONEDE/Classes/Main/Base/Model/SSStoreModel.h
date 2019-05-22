//
//  SSStoreModel.h
//  BONEDE
//
//  Created by gao lei on 2018/9/20.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSBaseModel.h"

@interface SSStoreModel : SSBaseModel

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * district;
@property (nonatomic, strong) NSString * mask_img;
@property (nonatomic, strong) NSString * province;
@property (nonatomic, assign) NSInteger stars;
@property (nonatomic, assign) NSInteger store_id;
@property (nonatomic, strong) NSString * store_name;
@property (nonatomic, strong) NSString * intro;
@property (nonatomic, strong) NSString * distance;
@property (nonatomic, strong) NSArray * label;
@property (nonatomic, strong) NSString *cellphone;

@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@end
