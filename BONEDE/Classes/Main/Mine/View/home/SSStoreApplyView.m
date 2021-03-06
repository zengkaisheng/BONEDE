//
//  SSStoreApplyView.m
//  BONEDE
//
//  Created by hank on 2019/3/21.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSStoreApplyView.h"
#import "SSStoreApplyParModel.h"
#import "SSBlockTextField.h"
#import "ZHMapAroundInfoViewController.h"

@interface SSStoreApplyView (){
}

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTrue_name;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfname;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfcell_phone;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfid_number;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfstore_name;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfmobile;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfintro;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfaddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPCD;


@property (weak, nonatomic) IBOutlet UIButton *btnbusinessDel;

@property (weak, nonatomic) IBOutlet UIButton *btnMaskBtn;
@property (weak, nonatomic) IBOutlet UIButton *btnMaskInfoDel;


@end

@implementation SSStoreApplyView

- (void)setModel:(SSStoreApplyParModel *)model{
    _model = model;
    kMeWEAKSELF
    self.tfTrue_name.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.true_name = str;
    };
    
    self.tfname.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.name = str;
    };
    
    self.tfcell_phone.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.cellphone = str;
    };
    
    self.tfid_number.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.id_number = str;
    };
    
    self.tfstore_name.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.store_name = str;
    };
    
    self.tfmobile.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.mobile = str;
    };
    
    self.tfintro.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.intro = str;
    };
    
    self.tfaddress.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf->_model.address = str;
    };
}



- (void)reloadUI{
    
    
    _tfTrue_name.text = kMeUnNilStr(_model.true_name);
    _tfname.text = kMeUnNilStr(_model.name);;
    _tfcell_phone.text = kMeUnNilStr(_model.cellphone);;
    _tfid_number.text = kMeUnNilStr(_model.id_number);;
    
    _tfstore_name.text = kMeUnNilStr(_model.store_name);;
    _tfmobile.text = kMeUnNilStr(_model.mobile);;
    _tfintro.text = kMeUnNilStr(_model.intro);;
    
    SSBynamicPublishGridModel *business_imagesModel = _model.business_imagesModel;
    _btnbusinessDel.hidden = business_imagesModel.isAdd;
    _imgbusiness.image = business_imagesModel.image;
    
    SSBynamicPublishGridModel *mask_imgModel = _model.mask_imgModel;
    _btnMaskBtn.hidden = mask_imgModel.isAdd;
    _imgMask.image = mask_imgModel.image;

    SSBynamicPublishGridModel *mask_info_imgModel = _model.mask_info_imgModel;
    _btnMaskInfoDel.hidden = mask_info_imgModel.isAdd;
    _imgMaskInfo.image = mask_info_imgModel.image;
    
    self.tfaddress.text = kMeUnNilStr(_model.address);
    self.lblPCD.text = [NSString stringWithFormat:@"%@ %@ %@",kMeUnNilStr(_model.province),kMeUnNilStr(_model.city),kMeUnNilStr(_model.district)];
}

- (IBAction)imgTouch:(UIButton *)sender {
    //0 营业执照 1 店铺封面 2店铺详情
    NSInteger index = sender.tag - 1000;
    if(index>=0 && index <=2){
        kMeCallBlock(_selectImgBlock,index);
    }
}

- (IBAction)imgDelAction:(UIButton *)sender {
    NSInteger index = sender.tag - 2000;
    switch (index) {
        case SSStoreApplyViewImgBusinnessType:
        {
            _model.business_imagesModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnbusinessDel.hidden = YES;
            _imgbusiness.image = [UIImage imageNamed:@"icon_bynamicAdd"];
            
        }
            break;
        case SSStoreApplyViewImgMaskType:
        {
            _model.mask_imgModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnMaskBtn.hidden = YES;
            _imgMask.image = [UIImage imageNamed:@"icon_bynamicAdd"];
        }
            break;
        case SSStoreApplyViewImgMaskInfoType:
        {
            _model.mask_info_imgModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnMaskInfoDel.hidden = YES;
            _imgMaskInfo.image = [UIImage imageNamed:@"icon_bynamicAdd"];
        }
            break;
        default:
            break;
    }
}

- (IBAction)locationAction:(UIButton *)sender {
    kMeCallBlock(_locationBlock);
}

- (IBAction)applyAction:(UIButton *)sender {
    kMeCallBlock(_applyBlock);
}


@end
