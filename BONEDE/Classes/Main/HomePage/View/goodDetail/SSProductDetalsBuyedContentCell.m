//
//  SSProductDetalsBuyedContentCell.m
//  BONEDE
//
//  Created by hank on 2018/9/8.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSProductDetalsBuyedContentCell.h"
#import "SSGoodModel.h"

#define kLblWdith (37 * kMeFrameScaleX())

@interface SSProductDetalsBuyedContentCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *conlblWdith;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblIntergal;
@property (weak, nonatomic) IBOutlet UILabel *lblAppoint;
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;



@end

@implementation SSProductDetalsBuyedContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _conlblWdith.constant = kLblWdith;
    _lblPrice.adjustsFontSizeToFitWidth = YES;
    _lblIntergal.adjustsFontSizeToFitWidth = YES;
    // Initialization code
}

- (void)setUIWithModel:(SSGoodModel *)model{
    _lblAppoint.hidden = YES;
    _lblIntergal.hidden = NO;
    _imgIcon.hidden = NO;
    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(kMeUnNilStr(model.market_price).floatValue)];//kMeUnNilStr(model.money);
    _lblIntergal.text = [NSString stringWithFormat:@"¥%@",@(kMeUnNilStr(model.money).floatValue)];
}
- (void)setUIServiceWithModel:(SSGoodModel *)model{
    _lblAppoint.hidden = NO;
    _lblIntergal.hidden = YES;
    _imgIcon.hidden = YES;
    _lblTitle.text = kMeUnNilStr(model.title);

    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(kMeUnNilStr(model.money).floatValue)];
}


@end
