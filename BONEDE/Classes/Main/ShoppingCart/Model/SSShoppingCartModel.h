//
//  SSShoppingCartModel.h
//  BONEDE
//
//  Created by hank on 2018/9/8.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSBaseModel.h"

//@class SSGoodsModel;
//
//@interface SSStoreModel : SSBaseModel
//
//@property (nonatomic, copy) NSString *id;
//@property (nonatomic, strong) NSArray *goods;
//@property (nonatomic, copy) NSString *shopName;
//@property (nonatomic, copy) NSString *sid;
//
//
//
//@property (nonatomic, strong) NSMutableArray *goodsArray;
//@property (nonatomic, assign) BOOL isSelect;
//
//@end



@interface SSShoppingCartModel : SSBaseModel

@property (nonatomic, assign) NSUInteger product_cart_id;
@property (nonatomic, assign) NSUInteger product_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *images;
@property (nonatomic, copy) NSString *images_url;
@property (nonatomic, copy) NSString *spec_name;
//9 秒杀 1 普通
@property (nonatomic, assign) NSUInteger product_type;

@property (nonatomic, assign) NSUInteger goods_num;
@property (nonatomic, assign) NSUInteger stock;


@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *shopName;
@end
