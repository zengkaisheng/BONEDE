//
//  SSClerksSortCell.m
//  BONEDE
//
//  Created by hank on 2019/1/6.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSClerksSortCell.h"
#import "SSClerksSortModel.h"

@interface SSClerksSortCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTel;
@property (weak, nonatomic) IBOutlet UILabel *lblZfNNum;
@property (weak, nonatomic) IBOutlet UILabel *lblReadNum;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;

@end

@implementation SSClerksSortCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUIWithModel:(SSClerksSortModel *)model{
    kSDLoadImg(_imgPic, kMeUnNilStr(model.header_pic));
    _lblTitle.text = kMeUnNilStr(model.name);
    _lblTel.text = [NSString stringWithFormat:@"手机号:%@",kMeUnNilStr(model.cellphone)];
    _lblZfNNum.text = kMeUnNilStr(model.share);
    _lblReadNum.text = kMeUnNilStr(model.read);
    _lblMoney.text = kMeUnNilStr(model.brokerage);
}

@end
