//
//  SSClerkTaskDetailModel.h
//  BONEDE
//
//  Created by hank on 2019/4/18.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSClerkTaskDetailModel : SSBaseModel

@property (nonatomic, assign) NSInteger clerk_id;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, strong) NSString * finished_at;
@property (nonatomic, strong) NSString * header_pic;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger is_receive;
@property (nonatomic, strong) NSString * last_time;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * nick_name;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger store_id;
@property (nonatomic, strong) NSString * task_content;
@property (nonatomic, strong) NSString * task_title;
@property (nonatomic, strong) NSString * updated_at;

@property (nonatomic, strong) NSString * matters_attention;
@property (nonatomic, strong) NSString * service_at;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * reservation_num;

@end

NS_ASSUME_NONNULL_END
