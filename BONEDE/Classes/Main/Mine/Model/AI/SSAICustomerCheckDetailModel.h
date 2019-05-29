//
//  SSAICustomerCheckDetailModel.h
//  BONEDE
//
//  Created by gao lei on 2019/5/29.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSAICustomerCheckDetailModel : SSBaseModel

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger count_type;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * header_pic;
@property (nonatomic, assign) NSInteger member_id;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * share_store;

@end

NS_ASSUME_NONNULL_END
