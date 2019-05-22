//
//  SSMineBargainContentModel.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSMineBargainContentModel : SSBaseModel

@property (nonatomic , copy) NSString              * images;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , copy) NSString              *idField;
@property (nonatomic , copy) NSString              *product_id;
@property (nonatomic , copy) NSString              *days;
@property (nonatomic , copy) NSString              *hours;
@property (nonatomic , copy) NSString              *minutes;
@property (nonatomic , copy) NSString              *bargin_num;
@property (nonatomic , copy) NSString              * amount_money;
@property (nonatomic , copy) NSString              *start_num;
@property (nonatomic , copy) NSString              *bargin_count;
@property (nonatomic , copy) NSString              * start_time;
@property (nonatomic , copy) NSString              * end_time;
@property (nonatomic , copy) NSString              * rule;
@property (nonatomic , copy) NSString              *store_id;
@property (nonatomic , copy) NSString              * image;
@property (nonatomic , copy) NSString              *status;
@property (nonatomic , copy) NSString              * created_at;
@property (nonatomic , copy) NSString              * updated_at;
@property (nonatomic , copy) NSString              * deleted_at;

@end

NS_ASSUME_NONNULL_END
