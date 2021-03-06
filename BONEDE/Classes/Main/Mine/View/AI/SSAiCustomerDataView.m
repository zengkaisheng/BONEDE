//
//  SSAiCustomerDataView.m
//  SS时代
//
//  Created by hank on 2019/4/11.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSAiCustomerDataView.h"
#import "SSBlockTextField.h"
#import "SSBlockTextView.h"
#import "SSAiCustomerDataModel.h"

@interface SSAiCustomerDataView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfName;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTel;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfWx;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfSex;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfAge;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfCity;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfWork;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfCompand;

@property (weak, nonatomic) IBOutlet SSBlockTextView *tvMark;

@end


@implementation SSAiCustomerDataView

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setModel:(SSAiCustomerDataModel *)model{
    _model = model;
    kMeWEAKSELF
    _tfName.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.name = kMeUnNilStr(str);
    };
    _tfTel.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.cellphone = kMeUnNilStr(str);
    };
    _tfWx.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.wechat_name = kMeUnNilStr(str);
    };
//    _tfName.contentBlock = ^(NSString *str) {
//        kMeSTRONGSELF
//        strongSelf.model.name = kMeUnNilStr(str);
//    };
    _tfAge.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.age = kMeUnNilStr(str);
    };
    _tfCity.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.city = kMeUnNilStr(str);
    };
    _tfWork.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.professional = kMeUnNilStr(str);
    };
    _tfCompand.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.company = kMeUnNilStr(str);
    };
    _tvMark.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.desc = kMeUnNilStr(str);
    };
}

- (void)reloadUI{
    kSDLoadImg(_imgPic, kMeUnNilStr(self.model.header_pic));
    _lblTitle.text = kMeUnNilStr(self.model.nick_name);
    _lblTime.text = [NSString stringWithFormat:@"加入时间:%@",kMeUnNilStr(self.model.created_at)];
    _tfName.text = kMeUnNilStr(self.model.name);
    _tfTel.text = kMeUnNilStr(self.model.cellphone);
    _tfWx.text = kMeUnNilStr(self.model.wechat_name);
    _tfAge.text = kMeUnNilStr(self.model.age);
    _tfCity.text = kMeUnNilStr(self.model.city);
    _tfWork.text = kMeUnNilStr(self.model.professional);
    _tfCompand.text = kMeUnNilStr(self.model.company);
    _tfSex.text = kMeUnNilStr(self.model.sexStr);
    _tvMark.text = kMeUnNilStr(self.model.desc);
}

- (IBAction)sexAction:(UIButton *)sender {
    [kMeCurrentWindow endEditing:YES];
    SSCustomActionSheet *sheet = [[SSCustomActionSheet alloc]initWithTitles:@[@"男",@"女",@"保密"]];
    kMeWEAKSELF
    sheet.blockBtnTapHandle = ^(NSInteger index){
        kMeSTRONGSELF
        if(index>=0 && index<=2){
            strongSelf.model.sex = index + 1;
            [strongSelf reloadUI];
        }
    };
    [sheet show];
}

- (IBAction)saveAction:(UIButton *)sender {
    kMeCallBlock(_saveBlock);
}

- (IBAction)callAction:(UIButton *)sender {
    [kMeCurrentWindow endEditing:YES];
    [SSCommonTool showWithTellPhone:kMeUnNilStr(_model.cellphone) inView:self];
}


@end
