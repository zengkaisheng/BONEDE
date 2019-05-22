//
//  SSMineActiveModel.h
//  BONEDE
//
//  Created by hank on 2019/1/11.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSMineActiveactivityModel : SSBaseModel

@property (nonatomic, strong) NSString * activity_id;
@property (nonatomic, strong) NSString * activity_name;
@property (nonatomic, strong) NSString * posters_id;
@property (nonatomic, strong) NSString * redbag_id;

@end

@interface SSMineActiveModel : SSBaseModel

@property (nonatomic, strong) NSString * activity_id;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) SSMineActiveactivityModel *activity;
@property (nonatomic, strong) NSString * images_url;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * member_id;
@property (nonatomic, strong) NSString * updated_at;
//1 进行中 2已完成
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSString * level;
@property (nonatomic, strong) NSString * level_on;
@property (nonatomic, strong) NSString * money;
@end

NS_ASSUME_NONNULL_END
