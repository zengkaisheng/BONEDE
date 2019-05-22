//
//  SSMineSignInCell.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSMineSignInCell.h"
#import "SSMineSignInParModel.h"
#import "SSBlockTextField.h"
#import "THDatePickerView.h"
#import "SSActiveGoodLIstVC.h"
#import "SSMineSignInVC.h"

@interface SSMineSignInCell ()

@property (nonatomic,strong) SSMineSignInParModel *model;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfStartTime;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfEndTime;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTitle;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfWardCount;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfGoodId;

@end

@implementation SSMineSignInCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;

}

- (void)setUiWithModel:(SSMineSignInParModel *)model{
    self.model = model;
    kMeWEAKSELF
    _tfTitle.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.title = kMeUnNilStr(str);
    };
    _tfTitle.text = kMeUnNilStr(_model.title);
    _tfStartTime.text = kMeUnNilStr(_model.start_time);
    _tfEndTime.text = kMeUnNilStr(_model.end_time);
    _tfWardCount.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.total = kMeUnNilStr(str);
    };
    _tfWardCount.text = kMeUnNilStr(_model.total);
    if(kMeUnNilStr(_model.product_id).length){
        _tfGoodId.text = [NSString stringWithFormat:@"商品ID:%@",kMeUnNilStr(_model.product_id)];
    }else{
        _tfGoodId.text = @"";
    }

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
    SSMineSignInVC *homeVc = [SSCommonTool getVCWithClassWtihClassName:[SSMineSignInVC class] targetResponderView:self];
    if(homeVc){
        SSActiveGoodLIstVC *vc = [[SSActiveGoodLIstVC alloc]init];
        vc.isSignIN = YES;
        kMeWEAKSELF
        vc.selectBlock = ^(NSString *str) {
            kMeSTRONGSELF
            strongSelf->_tfGoodId.text = [NSString stringWithFormat:@"商品ID:%@",kMeUnNilStr(str)];
            strongSelf->_model.product_id = str;
        };
        [homeVc.navigationController pushViewController:vc animated:YES];
    }
}


@end
