//
//  SSMineSignInParModel.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSMineSignInParModel : SSBaseModel

@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *product_id;//签到商品
@property (nonatomic,strong) NSString *start_time;
@property (nonatomic,strong) NSString *end_time;
@property (nonatomic,strong) NSString *total;
@property (nonatomic,strong) NSString *rule;
@property (nonatomic,strong) NSString *idField;
@end

NS_ASSUME_NONNULL_END
