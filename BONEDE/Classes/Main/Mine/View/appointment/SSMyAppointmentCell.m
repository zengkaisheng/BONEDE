//
//  SSMyAppointmentCell.m
//  BONEDE
//
//  Created by hank on 2018/9/12.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSMyAppointmentCell.h"
#import "SSAppointmentModel.h"

@interface SSMyAppointmentCell(){
    NSArray *_arrType;
    SSAppointmentModel *_model;
}

@property (weak, nonatomic) IBOutlet UILabel *lblOrderNum;
@property (weak, nonatomic) IBOutlet UIButton *btnCancelOrder;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;


@end

@implementation SSMyAppointmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    _arrType = SSAppointmenyStyleTitle;
    // Initialization code
}

//B 员工端的 预约管理
- (void)setBUIWithModel:(SSAppointmentModel *)model Type:(SSAppointmenyStyle)type{
    _model = model;
    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    _btnCancelOrder.hidden = YES;
    _lblStatus.text = _arrType[type];
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblDate.text = [NSString stringWithFormat:@"%@ 数量:%@",kMeUnNilStr(model.created_at),kMeUnNilStr(model.reserve_number)];
    CGFloat price = [kMeUnNilStr(model.money) floatValue] * [kMeUnNilStr(model.reserve_number) floatValue];
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(price)];
    _lblOrderNum.text = kMeUnNilStr(_model.reserve_sn);
}

//c端的 我的预约
- (void)setUIWithModel:(SSAppointmentModel *)model Type:(SSAppointmenyStyle)type{
    _model = model;
    kSDLoadImg(_imgPic, SSLoadQiniuImagesWithUrl(kMeUnNilStr(model.images)));
    _btnCancelOrder.hidden = type!=SSAppointmenyUseing;
    _lblStatus.text = _arrType[type];
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblDate.text = [NSString stringWithFormat:@"%@ 数量:%@",kMeUnNilStr(model.created_at),kMeUnNilStr(model.reserve_number)];
    CGFloat price = [kMeUnNilStr(model.money) floatValue] * [kMeUnNilStr(model.reserve_number) floatValue];
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(price)];
    _lblOrderNum.text = kMeUnNilStr(_model.reserve_sn);
}

- (IBAction)cancelAppointAction:(UIButton *)sender {
    SSAlertView *aler = [[SSAlertView alloc] initWithTitle:@"" message:@"确定要取消该预约吗?"];
    [aler addButtonWithTitle:@"取消"];
    kMeWEAKSELF
    [aler addButtonWithTitle:@"确定" block:^{
        kMeSTRONGSELF
        [SSPublicNetWorkTool postDelAppointWithReserveSn:strongSelf->_model.reserve_sn successBlock:^(ZLRequestResponse *responseObject) {
        
            kMeCallBlock(strongSelf->_cancelAppointBlock);
            kNoticeReloadAppoint
        } failure:^(id object) {
            
        }];
    }];
    [aler show];
}

@end
