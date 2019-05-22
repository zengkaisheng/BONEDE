//
//  SSAddGoodGoodAttributeCell.m
//  BONEDE
//
//  Created by hank on 2019/3/27.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSAddGoodGoodAttributeCell.h"
#import "SSAddGoodModel.h"
#import "SSBlockTextField.h"

@interface SSAddGoodGoodAttributeCell ()

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfKey;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfRestrict_num;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfSendTime;


@property (strong, nonatomic) SSAddGoodModel *model;

@property (weak, nonatomic) IBOutlet UIButton *btnStateY;
@property (weak, nonatomic) IBOutlet UIButton *btnStateN;

@property (weak, nonatomic) IBOutlet UIButton *btnHotY;
@property (weak, nonatomic) IBOutlet UIButton *btnHotN;
@property (weak, nonatomic) IBOutlet UIButton *btnRecommendY;
@property (weak, nonatomic) IBOutlet UIButton *btnRecommendN;
@property (weak, nonatomic) IBOutlet UIButton *btnNewY;
@property (weak, nonatomic) IBOutlet UIButton *btnNewN;

@property (weak, nonatomic) IBOutlet UIButton *btnClerkShareY;
@property (weak, nonatomic) IBOutlet UIButton *btnClerkShareN;

@property (weak, nonatomic) IBOutlet UIButton *btnGoodDel;
@property (weak, nonatomic) IBOutlet UIButton *btnGoodHotDel;
@property (weak, nonatomic) IBOutlet UIButton *btnGoodRecommendDel;

@property (weak, nonatomic) IBOutlet UIButton *btnShowAll;
@property (weak, nonatomic) IBOutlet UIButton *btnShowWebApp;
@property (weak, nonatomic) IBOutlet UIButton *btnShowApp;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfSpc;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfGoodDetail;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfchuxiao;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfpeisong;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfyunfei;


@end

@implementation SSAddGoodGoodAttributeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)setUIWithModel:(SSAddGoodModel *)model{
    _model = model;
    kMeWEAKSELF
    _tfKey.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.keywords = kMeUnNilStr(str);
    };
    _tfKey.text = kMeUnNilStr(_model.keywords);
    
    _tfRestrict_num.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.restrict_num = kMeUnNilStr(str);
    };
    _tfRestrict_num.text = kMeUnNilStr(_model.restrict_num);
    
    
    _tfSendTime.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.delivery = kMeUnNilStr(str);
    };
    _tfSendTime.text = kMeUnNilStr(_model.delivery);
    
    NSString *strImg = kMeUnNilStr(_model.images);
    if(strImg.length){
        _btnGoodDel.hidden = NO;
        kSDLoadImg(_imgGood, SSLoadAddQiniuImagesWithUrl(strImg));
    }else{
        _btnGoodDel.hidden = YES;
        _imgGood.image = [UIImage imageNamed:@"icon_bynamicAdd"];
    }
    
    
    NSString *strImgHot = kMeUnNilStr(_model.images_hot);
    if(strImgHot.length){
        _btnGoodHotDel.hidden = NO;
        kSDLoadImg(_imgGoodHot, SSLoadAddQiniuImagesWithUrl(strImgHot));

    }else{
        _btnGoodHotDel.hidden = YES;
        _imgGoodHot.image = [UIImage imageNamed:@"icon_bynamicAdd"];
    }
    
    NSString *strImgRec = kMeUnNilStr(_model.image_rec);
    if(strImgRec.length){
        _btnGoodRecommendDel.hidden = NO;
        kSDLoadImg(_imgRecommend, SSLoadAddQiniuImagesWithUrl(strImgRec));
    }else{
        _btnGoodRecommendDel.hidden = YES;
        _imgRecommend.image = [UIImage imageNamed:@"icon_bynamicAdd"];
    }
    
    if(_model.arrAddSpec.count==0){
        _tfSpc.text = @"";
    }else{
        _tfSpc.text = @"已填写";
    }
    
    if(kMeUnNilStr(_model.content).length){
        _tfGoodDetail.text = @"已填写";
    }else{
        _tfGoodDetail.text = @"";
    }
    if(kMeUnNilStr(_model.promotion).length){
        _tfchuxiao.text = @"已填写";
    }else{
        _tfchuxiao.text = @"";
    }
    
    if(kMeUnNilStr(_model.distribution).length){
        _tfpeisong.text = @"已填写";
    }else{
        _tfpeisong.text = @"";
    }
    
    if(kMeUnNilStr(_model.prompt).length){
        _tfyunfei.text = @"已填写";
    }else{
        _tfyunfei.text = @"";
    }
    
    [self reloadBtn];
}

- (void)reloadBtn{
    if(_model.state == 1){
        _btnStateY.selected = YES;
        _btnStateN.selected = NO;
    }else{
        _btnStateY.selected = NO;
        _btnStateN.selected = YES;
    }
    
    if(_model.is_hot == 1){
        _btnHotY.selected = YES;
        _btnHotN.selected = NO;
    }else{
        _btnHotY.selected = NO;
        _btnHotN.selected = YES;
    }
    
    
    if(_model.is_recommend == 1){
        _btnRecommendY.selected = YES;
        _btnRecommendN.selected = NO;
    }else{
        _btnRecommendY.selected = NO;
        _btnRecommendN.selected = YES;
    }
    
    
    if(_model.is_new == 1){
        _btnNewY.selected = YES;
        _btnNewN.selected = NO;
    }else{
        _btnNewY.selected = NO;
        _btnNewN.selected = YES;
    }
    
    if(_model.is_clerk_share == 1){
        _btnClerkShareY.selected = YES;
        _btnClerkShareN.selected = NO;
    }else{
        _btnClerkShareY.selected = NO;
        _btnClerkShareN.selected = YES;
    }
    
    //1全部显示 2小程序 3APP
    if(_model.tool == 1){
        _btnShowAll.selected = YES;
        _btnShowApp.selected = NO;
        _btnShowWebApp.selected = NO;
    }else if (_model.tool == 2){
        _btnShowAll.selected = NO;
        _btnShowApp.selected = NO;
        _btnShowWebApp.selected = YES;
    }else{
        _btnShowAll.selected = NO;
        _btnShowApp.selected = YES;
        _btnShowWebApp.selected = NO;
    }
}

- (IBAction)selectSpecAction:(UIButton *)sender {
    kMeCallBlock(_selectSpecBlock);
}

- (IBAction)stateAction:(UIButton *)sender {
    //0 是 1s否
    NSInteger index = sender.tag%2;
    if(!index){
        //0
        _model.state = 1;
    }else{
        _model.state = 2;
    }
    [self reloadBtn];
}

- (IBAction)hotAction:(UIButton *)sender {
    //0 是 1s否
    NSInteger index = sender.tag%2;
    if(!index){
        //0
        _model.is_hot = 1;
    }else{
        _model.is_hot = 2;
    }
    [self reloadBtn];
}

- (IBAction)showAction:(UIButton *)sender {
    _model.tool = 2;
    [self reloadBtn];
}


- (IBAction)recommendAction:(UIButton *)sender {
    //0 是 1s否
    NSInteger index = sender.tag%2;
    if(!index){
        //0
        _model.is_recommend = 1;
    }else{
        _model.is_recommend = 2;
    }
    [self reloadBtn];
}

- (IBAction)newAction:(UIButton *)sender {
    //0 是 1s否
    NSInteger index = sender.tag%2;
    if(!index){
        //0
        _model.is_new = 1;
    }else{
        _model.is_new = 2;
    }
    [self reloadBtn];
}

- (IBAction)shareAction:(UIButton *)sender {
    //0 是 1s否
    NSInteger index = sender.tag%2;
    if(!index){
        //0
        _model.is_clerk_share = 1;
    }else{
        _model.is_clerk_share = 2;
    }
    [self reloadBtn];
}

- (IBAction)imgTouch:(UIButton *)sender {
    NSInteger index = sender.tag - 1000;
    if(index>=0 && index <=2){
        kMeCallBlock(_selectImgBlock,index);
    }
}

- (IBAction)imgDelAction:(UIButton *)sender {
    NSInteger index = sender.tag - 2000;
    switch (index) {
        case 0:
        {
            _model.images = @"";
//            _model.business_imagesModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnGoodDel.hidden = YES;
            _imgGood.image = [UIImage imageNamed:@"icon_bynamicAdd"];
            
        }
            break;
        case 1:
        {
            _model.images_hot = @"";
//            _model.mask_imgModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnGoodHotDel.hidden = YES;
            _imgGoodHot.image = [UIImage imageNamed:@"icon_bynamicAdd"];
        }
            break;
        case 2:
        {
            _model.image_rec = @"";
//            _model.mask_info_imgModel = [SSBynamicPublishGridModel modelWithImage:[UIImage imageNamed:@"icon_bynamicAdd"] isAdd:YES];
            _btnGoodRecommendDel.hidden = YES;
            _imgRecommend.image = [UIImage imageNamed:@"icon_bynamicAdd"];
        }
            break;
        default:
            break;
    }
}

- (IBAction)richEditAction:(UIButton *)sender {
    kMeCallBlock(_selectRichEditBlock);
}

- (IBAction)chuxiaoAction:(UIButton *)sender {
    kMeCallBlock(_chuxiaoBlock);
}

- (IBAction)peisongAction:(UIButton *)sender {
    kMeCallBlock(_peisongBlock);
}

- (IBAction)yunfeiAction:(UIButton *)sender {
    kMeCallBlock(_yunfeiBlock);
}


@end
