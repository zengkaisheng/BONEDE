//
//  SSVisitHomeHeaderView.m
//  BONEDE
//
//  Created by hank on 2018/11/28.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSVisitHomeHeaderView.h"
#import "SSVistorCountModel.h"


@interface SSVisitHomeHeaderView ()

@property (weak, nonatomic) IBOutlet UIView *viewForAA;
@property (weak, nonatomic) IBOutlet UILabel *lbltoday;
@property (weak, nonatomic) IBOutlet UILabel *lblAllDay;
@property (weak, nonatomic) IBOutlet UILabel *lblShareToday;
@property (weak, nonatomic) IBOutlet UILabel *lblShareAll;
@property (weak, nonatomic) IBOutlet UILabel *lblShareCountToday;
@property (weak, nonatomic) IBOutlet UILabel *lblShareCountAll;
@property (weak, nonatomic) IBOutlet UIView *topBGView;

@property (weak, nonatomic) IBOutlet UIButton *posterBtn;
@property (weak, nonatomic) IBOutlet UIButton *articleBtn;
@property (weak, nonatomic) IBOutlet UIButton *activityBtn;
@property (weak, nonatomic) IBOutlet UIView *grayBGView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *grayViewConsHeight;

@end

@implementation SSVisitHomeHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    _viewForAA.layer.shadowColor = kSSPink.CGColor;
    _viewForAA.layer.shadowOpacity = 0.5;
    _viewForAA.layer.shadowOffset = CGSizeMake(0, 0);
    _viewForAA.layer.shadowRadius = 2;
    
    [_posterBtn setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:15];
    [_articleBtn setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:15];
    [_activityBtn setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:15];
    _grayViewConsHeight.constant = 0.0;
    _grayBGView.hidden = YES;
}

- (void)setUIWithModel:(SSVistorCountModel *)model{
    
    if(kCurrentUser.user_type == 3) {
        _grayBGView.hidden = NO;
        _grayViewConsHeight.constant = 190.0*kMeFrameScaleY();
        _topBGView.backgroundColor = [UIColor whiteColor];
        
    }else if (kCurrentUser.user_type == 5) {
        _grayBGView.hidden = YES;
        _grayViewConsHeight.constant = 0.0;
        _topBGView.backgroundColor = [UIColor colorWithHexString:@"#108EE9"];
    }
    _lbltoday.text = kMeUnNilStr(model.today);
    _lblAllDay.text = kMeUnNilStr(model.all_day);
    _lblShareToday.text = kMeUnNilStr(model.share_today);
    _lblShareCountToday.text = kMeUnNilStr(model.share_count_today);
    _lblShareCountAll.text = kMeUnNilStr(model.share_count_all);
    _lblShareAll.text = kMeUnNilStr(model.share_all);
}
- (IBAction)posterBtnAction:(id)sender {
//    NSLog(@"点击了获客海报");
    if (self.indexBlock) {
        self.indexBlock(0);
    }
}
- (IBAction)articleBtnAction:(id)sender {
//    NSLog(@"点击了获客文章");
    if (self.indexBlock) {
        self.indexBlock(1);
    }
}
- (IBAction)activityBtnAction:(id)sender {
//    NSLog(@"点击了获客活动");
    if (self.indexBlock) {
        self.indexBlock(2);
    }
}

+ (CGFloat)getViewHeight{
    CGFloat height = kSSVisitHomeHeaderViewHeight;
    if (kCurrentUser.user_type == 3) {
        height = kSSVisitHomeHeaderViewNewHeight;
    }
    if(kMeFrameScaleX()<1){
        height -=60;
        height +=(60 * kMeFrameScaleX());
    }
    return height;
}
@end
