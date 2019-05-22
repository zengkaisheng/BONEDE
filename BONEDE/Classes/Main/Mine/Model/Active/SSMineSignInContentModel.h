//
//  SSMineSignInContentModel.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
/*
 {
 "id": 2,
 "title": "签到活动",
 "image": "3f8ed826aa4ad2aa4aa0ffd4189fd5fd",
 "end_time": "2019-05-20 00:00:00",
 "rule": "签到规则",
 "total": 5,
 "status": 1,
 "created_at": "2019-05-16 15:02:25",
 "store_id": 55,
 "product_id": 6,
 "product_name": "测试商品5",
 "image_url": "https://images.bondehome.com/3f8ed826aa4ad2aa4aa0ffd4189fd5fd"
 }
 */
@interface SSMineSignInContentModel : SSBaseModel
@property (nonatomic , copy) NSString              * idField;
@property (nonatomic , copy) NSString              *title;
@property (nonatomic , copy) NSString              * image;
@property (nonatomic , copy) NSString              *end_time;
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , copy) NSString              *rule;
@property (nonatomic , copy) NSString              * total;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , copy) NSString              * created_at;
@property (nonatomic , copy) NSString              *store_id;
@property (nonatomic , copy) NSString              * product_id;
@property (nonatomic , copy) NSString              *product_name;
@property (nonatomic , copy) NSString              *image_url;
@end

NS_ASSUME_NONNULL_END
