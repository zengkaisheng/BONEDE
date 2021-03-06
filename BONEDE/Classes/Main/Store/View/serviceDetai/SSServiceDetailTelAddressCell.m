//
//  SSServiceDetailTelAddressCell.m
//  BONEDE
//
//  Created by hank on 2018/9/14.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSServiceDetailTelAddressCell.h"
#import "SSStoreDetailModel.h"

@interface SSServiceDetailTelAddressCell (){
    SSStoreDetailModel *_model;
}
@property (weak, nonatomic) IBOutlet UIView *viewForAddress;
@property (weak, nonatomic) IBOutlet UIView *viewForTel;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblTel;

@end

@implementation SSServiceDetailTelAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    _viewForAddress.userInteractionEnabled = YES;
    _viewForTel.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addressAction:)];
    [_viewForAddress addGestureRecognizer:ges];
    
    UITapGestureRecognizer *gestel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(telAction:)];
    [_viewForTel addGestureRecognizer:gestel];
    // Initialization code
}

- (void)addressAction:(UITapGestureRecognizer *)ges{
    [SSCommonTool doNavigationWithEndLocation:@[kMeUnNilStr(_model.latitude),kMeUnNilStr(_model.longitude)]];
}

- (void)telAction:(UITapGestureRecognizer*)ges{
    if(kMeUnNilStr(_model.mobile).length){
         [SSCommonTool showWithTellPhone:kMeUnNilStr(_model.mobile) inView:self];
    }else{
         [SSCommonTool showWithTellPhone:kMeUnNilStr(_model.cellphone) inView:self];
    }
}

- (void)setUIWithModel:(SSStoreDetailModel *)model{
    _model = model;
    NSString *address = [NSString stringWithFormat:@"%@%@%@%@",kMeUnNilStr(model.province),kMeUnNilStr(model.city),kMeUnNilStr(model.district),kMeUnNilStr(model.address)];
    _lblAddress.text = address;
    if(kMeUnNilStr(_model.mobile).length){
        _lblTel.text = kMeUnNilStr(model.mobile);
    }else{
        _lblTel.text = kMeUnNilStr(model.cellphone);
    }
}



@end
