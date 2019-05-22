//
//  SSAddGoodBasicCell.m
//  BONEDE
//
//  Created by hank on 2019/3/27.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSAddGoodBasicCell.h"
#import "SSAddGoodModel.h"
#import "SSBlockTextField.h"


@interface SSAddGoodBasicCell ()

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfSort;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTitle;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfDesc;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfMarketPrice;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfMoney;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfPostage;


@property (nonatomic,strong) SSAddGoodModel *model;
@property (weak, nonatomic) IBOutlet UIButton *btnGood;
@property (weak, nonatomic) IBOutlet UIButton *btnActive;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfCat;
@property (weak, nonatomic) IBOutlet UIButton *btnKanjia;
@property (weak, nonatomic) IBOutlet UIButton *btnqiandao;


@end

@implementation SSAddGoodBasicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUIWithModel:(SSAddGoodModel *)model{
    _model = model;
    //1 商品 7拼团 13砍价 14签到
    if(self.model.store_product_type == 1){
        _btnGood.selected = YES;
        _btnActive.selected = NO;
        _btnKanjia.selected = NO;
        _btnqiandao.selected = NO;
    }else if(self.model.store_product_type == 7){
        _btnGood.selected = NO;
        _btnActive.selected = YES;
        _btnKanjia.selected = NO;
        _btnqiandao.selected = NO;
    }else if(self.model.store_product_type == 13){
        _btnGood.selected = NO;
        _btnActive.selected = NO;
        _btnKanjia.selected = YES;
        _btnqiandao.selected = NO;
    }else if(self.model.store_product_type == 14){
        _btnGood.selected = NO;
        _btnActive.selected = NO;
        _btnKanjia.selected = NO;
        _btnqiandao.selected = YES;
    }else{
        _btnGood.selected = NO;
        _btnActive.selected = NO;
        _btnKanjia.selected = NO;
        _btnqiandao.selected = NO;
    }
    kMeWEAKSELF
    _tfSort.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.list_order = kMeUnNilStr(str);
    };
    _tfSort.text = kMeUnNilStr(self.model.list_order);
    
    _tfTitle.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.title = kMeUnNilStr(str);
    };
    _tfTitle.text = kMeUnNilStr(self.model.title);
    
    _tfDesc.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.desc = kMeUnNilStr(str);
    };
    _tfDesc.text = kMeUnNilStr(self.model.desc);
    
    _tfMarketPrice.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.market_price = kMeUnNilStr(str);
    };
    _tfMarketPrice.text = kMeUnNilStr(self.model.market_price);
    
    _tfMoney.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.money = kMeUnNilStr(str);
    };
    _tfMoney.text = kMeUnNilStr(self.model.money);
    
    _tfPostage.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.postage = kMeUnNilStr(str);
    };
    _tfPostage.text = kMeUnNilStr(self.model.postage);
    
    _tfCat.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.category = kMeUnNilStr(str);
    };
    _tfCat.text = kMeUnNilStr(self.model.category);
}

- (IBAction)goodAction:(UIButton *)sender {
    self.model.store_product_type = 1;
    _btnGood.selected = YES;
    _btnActive.selected = NO;
    _btnKanjia.selected = NO;
    _btnqiandao.selected = NO;
    kMeCallBlock(_selectType);
}

- (IBAction)actionAction:(UIButton *)sender {
    self.model.store_product_type = 7;
    _btnGood.selected = NO;
    _btnActive.selected = YES;
    _btnKanjia.selected = NO;
    _btnqiandao.selected = NO;
    kMeCallBlock(_selectType);
}

- (IBAction)kanjiaAction:(UIButton *)sender {
    self.model.store_product_type = 13;
    _btnGood.selected = NO;
    _btnActive.selected = NO;
    _btnKanjia.selected = YES;
    _btnqiandao.selected = NO;
    kMeCallBlock(_selectType);
}

- (IBAction)qiandaoAction:(UIButton *)sender {
    self.model.store_product_type = 14;
    _btnGood.selected = NO;
    _btnActive.selected = NO;
    _btnKanjia.selected = NO;
    _btnqiandao.selected = YES;
    kMeCallBlock(_selectType);
}



- (IBAction)goodSortAction:(UIButton *)sender {
    kMeCallBlock(_selectGoodType);
}

@end
