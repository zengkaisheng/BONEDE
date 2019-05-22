//
//  SSMineAddBargainParModel.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSMineAddBargainParModel : SSBaseModel

@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *product_id;
@property (nonatomic,strong) NSString *days;
@property (nonatomic,strong) NSString *hours;
@property (nonatomic,strong) NSString *minutes;
@property (nonatomic,strong) NSString *bargin_num;
@property (nonatomic,strong) NSString *amount_money;
@property (nonatomic,strong) NSString *start_time;
@property (nonatomic,strong) NSString *end_time;
@property (nonatomic,strong) NSString *rule;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSString *idField;

@end

NS_ASSUME_NONNULL_END
