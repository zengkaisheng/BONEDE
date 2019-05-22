//
//  SSHomeTestTitleModel.h
//  BONEDE
//
//  Created by hank on 2019/5/21.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSHomeTestTitleModel : SSBaseModel

@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * image_url;
@property (nonatomic, assign) NSInteger is_delete;
@property (nonatomic, assign) NSInteger store_id;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * updated_at;

@end

NS_ASSUME_NONNULL_END
