//
//  SSAddGoodModel.h
//  BONEDE
//
//  Created by hank on 2019/3/28.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSAddGoodspecJsoneModel : SSBaseModel
@property (nonatomic,strong) NSString *value;
@property (nonatomic,strong) NSString *goods_price;
@property (nonatomic,strong) NSString *stock;
@property (nonatomic,strong) NSString *integral;
@property (nonatomic,strong) NSString *shop_integral;
@property (nonatomic,strong) NSString *spec_img;

@end

@interface SSAddGoodspecNameModel : SSBaseModel
@property (nonatomic,strong) NSArray *value;
@property (nonatomic,strong) NSString *key;
@end

@interface SSAddGoodModel : SSBaseModel

@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *list_order;//排序
@property (nonatomic,strong) NSString *title;//商品名称
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *market_price;//市场价格
@property (nonatomic,strong) NSString *money;//现价
@property (nonatomic,strong) NSString *postage;
//1 商品 7拼团 13砍价 14签到
@property (nonatomic,assign) NSInteger store_product_type;

@property (nonatomic,assign) CGFloat ratio_after_sales;//销售中心分成
@property (nonatomic,assign) CGFloat ratio_marketing;//营销中心分成
@property (nonatomic,assign) CGFloat ratio_store;//体验中心分成

@property (nonatomic,strong) NSString *group_num;
@property (nonatomic,strong) NSString *group_desc;
@property (nonatomic,strong) NSString *over_time;
@property (nonatomic,strong) NSString *red_packet;
@property (nonatomic,strong) NSString *start_time;
@property (nonatomic,strong) NSString *end_time;


@property (nonatomic,strong) NSString *images;
@property (nonatomic,strong) NSString *images_hot;
@property (nonatomic,strong) NSString *image_rec;


@property (nonatomic,strong) NSString *keywords;
@property (nonatomic,assign) NSInteger state;//上架
//1全部显示 2小程序 3APP
@property (nonatomic,assign) NSInteger tool//显示
;
@property (nonatomic,assign) NSInteger is_new;//是否新品
@property (nonatomic,assign) NSInteger is_hot;//爆款
@property (nonatomic,assign) NSInteger is_recommend;//推荐
@property (nonatomic,assign) NSInteger is_clerk_share;//是否推荐员工分享
@property (nonatomic,strong) NSString *restrict_num;//限制购买个数
@property (nonatomic,strong) NSString *category_id;//类目id
@property (nonatomic,strong) NSString *category;

@property (nonatomic,strong) NSString *content;//详情图标
@property (nonatomic,strong) NSString *product_id;//空为添加


@property (nonatomic,strong) NSString *spec_name;//详情图标
@property (nonatomic,strong) NSString *spec_json;//空为添加

@property (nonatomic,strong)NSMutableArray *arrAddSpec;//s添加的规格属性
@property (nonatomic,strong)NSMutableArray *arrSpec;//选择的顶上spec//规格 d大小

@property (nonatomic,strong) NSString *prompt;
@property (nonatomic,strong) NSString *promotion;
@property (nonatomic,strong) NSString *distribution;
@property (nonatomic,strong) NSString *delivery;


+(SSAddGoodModel *)getModel;
@end

NS_ASSUME_NONNULL_END
