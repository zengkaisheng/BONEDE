//
//  SSThridHomeModel.h
//  BONEDE
//
//  Created by hank on 2019/1/24.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface SSThridHomeBuyingGoodsModel : SSBaseModel

@property (nonatomic, assign) NSInteger product_id;
@property (nonatomic, assign) NSInteger product_type;
@property (nonatomic, strong) NSString * images;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * market_price;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * interval_price;

@end

@interface SSThridHomeAdModel : SSBaseModel

@property (nonatomic, strong) NSString * ad_id;
@property (nonatomic, strong) NSString * ad_name;
@property (nonatomic, strong) NSString * ad_img;
@property (nonatomic, strong) NSString * ad_url;
@property (nonatomic, assign) NSInteger product_id;

@end

@interface SSThridHomeserviceModel : SSBaseModel

@property (nonatomic, strong) NSString * images;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * interval_price;
@property (nonatomic, assign) NSInteger  product_id;

@end

@interface SSThridHomeBackgroundModel : SSBaseModel

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * keyworks;
@property (nonatomic, assign) NSInteger product_id;
@property (nonatomic, assign) NSInteger show_type;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger tool;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, assign) NSInteger voting_id;

@end



@interface SSThridHomeModel : SSBaseModel

@property (nonatomic, strong) SSThridHomeBackgroundModel * coupon_background;
@property (nonatomic, strong) SSThridHomeBackgroundModel * scare_buying_banner;
@property (nonatomic, strong) SSThridHomeBackgroundModel * member_exclusive;
@property (nonatomic, strong) NSArray * scare_buying_goods;
@property (nonatomic, strong) NSArray * service;
@property (nonatomic, strong) NSArray * top_banner;

@end

NS_ASSUME_NONNULL_END
