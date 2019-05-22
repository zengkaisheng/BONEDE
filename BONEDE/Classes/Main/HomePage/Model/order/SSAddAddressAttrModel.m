//
//  SSAddAddressAttrModel.m
//  BONEDE
//
//  Created by gao lei on 2018/9/18.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSAddAddressAttrModel.h"
#import "SSAddressModel.h"

@implementation SSAddAddressAttrModel

- (instancetype)initWithAddressModel:(SSAddressModel *)model{
    if(self = [super init]){
        self.token = kMeUnNilStr(kCurrentUser.token);
        self.address_id = @(model.address_id).description;
        self.truename = model.truename;
        self.province = model.province;
        self.city = model.city;
        self.district = model.district;
        self.detail_address = model.detail_address;
        self.telphone = model.telphone;
        self.is_default = model.is_default;
    }
    return self;
}


@end
