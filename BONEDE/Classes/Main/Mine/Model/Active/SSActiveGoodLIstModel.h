//
//  SSActiveGoodLIstModel.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSActiveGoodLIstModel : SSBaseModel

@property (nonatomic , copy) NSString              * product_id;

@property (nonatomic , copy) NSString              * title;

@property (nonatomic , copy) NSString              * interval_price;
@property (nonatomic , copy) NSString              * images;

@end

NS_ASSUME_NONNULL_END
