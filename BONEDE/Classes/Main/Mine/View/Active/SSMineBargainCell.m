//
//  SSMineBargainCell.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSMineBargainCell.h"
#import "SSMineAddBargainParModel.h"
#import "SSBlockTextField.h"
#import "THDatePickerView.h"
#import "SSActiveGoodLIstVC.h"
#import "SSMineBargainVC.h"
#import "SSBlockTextView.h"
#import "SSTimePickerView.h"

@interface SSMineBargainCell ()

@property (nonatomic,strong) SSMineAddBargainParModel *model;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfKanjiaMoney;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfKanjiaCount;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfStartTime;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfEndTime;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfkanjiaxianshi;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfKanjiaGood;
@property (weak, nonatomic) IBOutlet SSBlockTextView *tvrule;

@end

@implementation SSMineBargainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUiWithModel:(SSMineAddBargainParModel *)model{
    self.model = model;
    kMeWEAKSELF
    _tfKanjiaMoney.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.amount_money = kMeUnNilStr(str);
    };
    _tfKanjiaMoney.text = kMeUnNilStr(_model.amount_money);
    
    _tfKanjiaCount.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.bargin_num = kMeUnNilStr(str);
    };
    _tfKanjiaCount.text = kMeUnNilStr(_model.bargin_num);
    _tfStartTime.text = kMeUnNilStr(_model.start_time);
    _tfEndTime.text = kMeUnNilStr(_model.end_time);
    if(kMeUnNilStr(_model.days).length){
        _tfkanjiaxianshi.text = [NSString stringWithFormat:@"%@天 %@时 %@分",kMeUnNilStr(_model.days),kMeUnNilStr(_model.hours),kMeUnNilStr(_model.minutes)];
    }else{
        _tfkanjiaxianshi.text = @"";
    }
    if(kMeUnNilStr(_model.product_id).length){
        _tfKanjiaGood.text = [NSString stringWithFormat:@"商品ID:%@",kMeUnNilStr(_model.product_id)];
    }else{
        _tfKanjiaGood.text = @"";
    }
    _tvrule.text = kMeUnNilStr(_model.rule);
    _tvrule.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.rule = kMeUnNilStr(str);
    };
}

- (IBAction)startAction:(UIButton *)sender {
    kMeWEAKSELF
    THDatePickerView *view = [[THDatePickerView alloc]initWithSelectDaye:^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_tfStartTime.text = str;
        strongSelf->_model.start_time = str;
    }];
    [kMeCurrentWindow endEditing:YES];
    
    [kMeCurrentWindow addSubview:view];
    
}

- (IBAction)endAction:(UIButton *)sender {
    kMeWEAKSELF
    THDatePickerView *view = [[THDatePickerView alloc]initWithSelectDaye:^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_tfEndTime.text = str;
        strongSelf->_model.end_time = str;
    }];
    [kMeCurrentWindow endEditing:YES];
    
    [kMeCurrentWindow addSubview:view];
}

- (IBAction)selectGoodAction:(UIButton *)sender {
    [kMeCurrentWindow endEditing:YES];
    SSMineBargainVC *homeVc = [SSCommonTool getVCWithClassWtihClassName:[SSMineBargainVC class] targetResponderView:self];
    if(homeVc){
        SSActiveGoodLIstVC *vc = [[SSActiveGoodLIstVC alloc]init];
        vc.isSignIN = NO;
        kMeWEAKSELF
        vc.selectBlock = ^(NSString *str) {
            kMeSTRONGSELF
            strongSelf->_tfKanjiaGood.text = [NSString stringWithFormat:@"商品ID:%@",kMeUnNilStr(str)];
            strongSelf->_model.product_id = str;
        };
        [homeVc.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)xianshiAction:(UIButton *)sender {
    kMeWEAKSELF
    SSTimePickerView *view = [[SSTimePickerView alloc]initWithSelectDaye:^(NSDictionary *dic) {
        kMeSTRONGSELF
        NSString *day = dic[@"day"];
        NSString *hour = dic[@"hour"];
        NSString *min = dic[@"min"];
        strongSelf->_model.days = kMeUnNilStr(day);
        strongSelf->_model.hours = kMeUnNilStr(hour);
        strongSelf->_model.minutes = kMeUnNilStr(min);
        strongSelf->_tfkanjiaxianshi.text = [NSString stringWithFormat:@"%@天 %@时 %@分",kMeUnNilStr(day),kMeUnNilStr(hour),kMeUnNilStr(min)];
    }];
    [view show];
}


@end
