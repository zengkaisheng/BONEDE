//
//  SSMakeOrderHeaderCell.m
//  BONEDE
//
//  Created by hank on 2018/9/13.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSMakeOrderHeaderCell.h"
#import "SSGoodDetailModel.h"
#import "SSShoppingCartModel.h"

@interface SSMakeOrderHeaderCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblNum;
@property (weak, nonatomic) IBOutlet UILabel *lblSku;
@property (weak, nonatomic) IBOutlet UILabel *lblCommonPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UIImageView *imgVip;


@end



@implementation SSMakeOrderHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    _lblNum.adjustsFontSizeToFitWidth = YES;
    _lblSku.adjustsFontSizeToFitWidth = YES;
    _lblCommonPrice.adjustsFontSizeToFitWidth = YES;
    _lblTitle.adjustsFontSizeToFitWidth = YES;
    _lblPrice.adjustsFontSizeToFitWidth = YES;
}

- (void)setUIWithModle:(SSGoodDetailModel *)model isComb:(BOOL)isComb isInteral:(BOOL)isInteral{
//    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    if(kMeUnNilStr(model.psmodel.spec_img).length){
        kSDLoadImg(_imgPic, kMeUnNilStr(model.psmodel.spec_img));
    }else{
        kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    }
    
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblSku.text = kMeUnNilStr(model.skus);
    _lblNum.text = [NSString stringWithFormat:@"数量:%@",@(model.buynum).description];
    if(isInteral){
        _lblCommonPrice.textColor = kSSPink;
        _lblCommonPrice.text = [NSString stringWithFormat:@"%@美豆",kMeUnNilStr(model.psmodel.integral_lines)];
        _lblPrice.hidden = YES;
        _imgVip.hidden = YES;
    }else{
        _lblCommonPrice.text = [NSString stringWithFormat:@"市场同品价¥%@",kMeUnNilStr(model.market_price)];
        if(isComb){
            _lblPrice.text = kMeUnNilStr(model.money);
        }else{
            if(model.is_seckill==1){
                _lblPrice.text = kMeUnNilStr(model.psmodel.seckill_price);
            }else{
                _lblPrice.text = kMeUnNilStr(model.psmodel.goods_price);
            }
        }
        _lblPrice.hidden = NO;
    }

}

- (void)setShopCartUIWithModle:(SSShoppingCartModel *)model{
    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images_url)));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblSku.text = kMeUnNilStr(model.spec_name);
    _lblNum.text = [NSString stringWithFormat:@"数量:%@",@(model.goods_num).description];
    _lblCommonPrice.text = @"";//[NSString stringWithFormat:@"市场同品价¥%@",kMeUnNilStr(model.market_price)];
    _lblPrice.text = kMeUnNilStr(model.money);
}

@end
