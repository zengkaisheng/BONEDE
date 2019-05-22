//
//  SSClerkModel.h
//  BONEDE
//
//  Created by hank on 2018/12/13.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSBaseModel.h"

@interface SSClerkModel : SSBaseModel

@property (nonatomic, strong) NSString * cellphone;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * header_pic;
@property (nonatomic, strong) NSString *member_id;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * nick_name;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, assign) NSInteger share;
@property (nonatomic, assign) NSInteger user_type;
@property (nonatomic, assign) BOOL isSelect;
@end