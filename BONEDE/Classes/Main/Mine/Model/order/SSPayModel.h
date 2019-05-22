//
//  SSPayModel.h
//  BONEDE
//
//  Created by hank on 2018/9/28.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSBaseModel.h"

@interface SSPayModel : SSBaseModel

@property (nonatomic, strong) NSString * appid;
@property (nonatomic, strong) NSString * key;
@property (nonatomic, strong) NSString * noncestr;
@property (nonatomic, strong) NSString * packageField;
@property (nonatomic, strong) NSString * partnerid;
@property (nonatomic, strong) NSString * prepayid;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, assign) UInt32 timestamp;

@end