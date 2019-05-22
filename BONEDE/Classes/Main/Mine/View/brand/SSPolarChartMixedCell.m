//
//  SSPolarChartMixedCell.m
//  BONEDE
//
//  Created by hank on 2019/3/11.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSPolarChartMixedCell.h"
#import "AAChartKit.h"
#import "AAChartModel.h"
#import "SSBrandAbilityAnalysisModel.h"
#import "SSForuClerkAnalysisModel.h"

@interface SSPolarChartMixedCell ()<AAChartViewDidFinishLoadDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (weak, nonatomic) IBOutlet AAChartView *aaChartView;


@end

@implementation SSPolarChartMixedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    self.aaChartView.backgroundColor = [UIColor whiteColor];
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    [self.aaChartView aa_drawChartWithChartModel:self.aaChartModel];
    // Initialization code
}

- (void)setAnalysisUiWithModel:(SSForuClerkAnalysisModel *)model{
//    NSInteger allCount = model.total_store;
    NSMutableArray *arrdata = [NSMutableArray array];
//    if(allCount){
//        CGFloat sale_rank =1-((CGFloat) model.sale_rank/allCount);
//        [arrdata addObject:@(sale_rank)];
//        CGFloat communicate_rank = 1 - ((CGFloat)model.communicate_rank/allCount);
//        [arrdata addObject:@(communicate_rank)];
//        CGFloat product_rank = 1 - ((CGFloat)model.product_rank/allCount);
//        [arrdata addObject:@(product_rank)];
//        CGFloat activity_rank =1 - ((CGFloat) model.activity_rank/allCount);
//        [arrdata addObject:@(activity_rank)];
//        CGFloat sale_num_rank = 1 - ((CGFloat)model.sale_num_rank/allCount);
//        [arrdata addObject:@(sale_num_rank)];
//        CGFloat access_rank =1 - ((CGFloat) model.access_rank/allCount);
//        [arrdata addObject:@(access_rank)];
//    }else{
//        for (NSInteger i =0 ; i<6; i++) {
//            [arrdata addObject:@(0)];
//        }
//    }
    [arrdata addObject:@(model.customer_num)];
    [arrdata addObject:@(model.potential_customer_num)];
    [arrdata addObject:@(model.interaction_num)];
    [arrdata addObject:@(model.share_num)];
    [arrdata addObject:@(model.share_posters_num)];
    [arrdata addObject:@(model.share_article_num)];
    self.aaChartModel.categories = @[@"获客能力：客户数量", @"个人魅力：潜在客户数", @"客户互动：沟通数", @"销售能力：分享数", @"产品：分享海报数量", @"官网：文章分享数量"];
    self.aaChartModel.series =
    @[
      AASeriesElement.new
      .nameSet(@"能力")
      .typeSet(AAChartTypeArea)
      .dataSet(arrdata)
      ];
    [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
}

- (void)setUiWithModel:(SSBrandAbilityAnalysisModel *)model{
    NSInteger allCount = model.total_store;
    NSMutableArray *arrdata = [NSMutableArray array];
    if(allCount){
        CGFloat sale_rank =1-((CGFloat) model.sale_rank/allCount);
        [arrdata addObject:@(sale_rank)];
        CGFloat communicate_rank = 1 - ((CGFloat)model.communicate_rank/allCount);
        [arrdata addObject:@(communicate_rank)];
        CGFloat product_rank = 1 - ((CGFloat)model.product_rank/allCount);
        [arrdata addObject:@(product_rank)];
        CGFloat activity_rank =1 - ((CGFloat) model.activity_rank/allCount);
        [arrdata addObject:@(activity_rank)];
        CGFloat sale_num_rank = 1 - ((CGFloat)model.sale_num_rank/allCount);
        [arrdata addObject:@(sale_num_rank)];
        CGFloat access_rank =1 - ((CGFloat) model.access_rank/allCount);
        [arrdata addObject:@(access_rank)];
    }else{
        for (NSInteger i =0 ; i<6; i++) {
            [arrdata addObject:@(0)];
        }
    }
    self.aaChartModel.categories = @[@"销售能力", @"客户互动力", @"产品推广力", @"活动推广力", @"客户跟进力", @"获客能力"];
    self.aaChartModel.series =
    @[
      AASeriesElement.new
      .nameSet(@"能力")
      .typeSet(AAChartTypeArea)
      .dataSet(arrdata)
      ];
    [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
}

- (AAChartModel *)aaChartModel{
    if(!_aaChartModel){
        _aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .polarSet(true)
        .titleSet(@"");
    }
    return _aaChartModel;
}


#pragma mark -- AAChartView delegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"🔥🔥🔥🔥🔥 AAChartView content did finish load!!!");
}


@end
