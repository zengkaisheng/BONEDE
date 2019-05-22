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

@end

@implementation SSVisitHomeHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    _viewForAA.layer.shadowColor = kSSPink.CGColor;
    _viewForAA.layer.shadowOpacity = 0.5;
    _viewForAA.layer.shadowOffset = CGSizeMake(0, 0);
    _viewForAA.layer.shadowRadius = 2;
}

- (void)setUIWithModel:(SSVistorCountModel *)model{
    _lbltoday.text = kMeUnNilStr(model.today);
    _lblAllDay.text = kMeUnNilStr(model.all_day);
    _lblShareToday.text = kMeUnNilStr(model.share_today);
    _lblShareCountToday.text = kMeUnNilStr(model.share_count_today);
    _lblShareCountAll.text = kMeUnNilStr(model.share_count_all);
    _lblShareAll.text = kMeUnNilStr(model.share_all);
}

+ (CGFloat)getViewHeight{
    CGFloat height = kSSVisitHomeHeaderViewHeight;
    if(kMeFrameScaleX()<1){
        height -=60;
        height +=(60 * kMeFrameScaleX());
    }
    return height;
}
@end