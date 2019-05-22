//
//  SSStoreDetailModel.m
//  BONEDE
//
//  Created by hank on 2018/10/17.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSStoreDetailModel.h"
#import "SSStoreModel.h"

@implementation SSStoreDetailModel

+ (SSStoreDetailModel *)modelWithStoreModel:(SSStoreModel *)model{
    SSStoreDetailModel *detailModel = [SSStoreDetailModel new];
    detailModel.store_id = model.store_id;
    detailModel.store_name = model.store_name;
    detailModel.province = model.province;
    detailModel.district = model.district;
    detailModel.city = model.city;
    detailModel.address = model.address;
    detailModel.mask_img = model.mask_img;
    detailModel.stars = model.stars;
    detailModel.intro = model.intro;
    detailModel.mobile = model.cellphone;
    detailModel.latitude = model.latitude;
    detailModel.longitude = model.longitude;
    return detailModel;
}
@end
