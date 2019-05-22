//
//  SSPolarChartMixedCell.h
//  BONEDE
//
//  Created by hank on 2019/3/11.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSBrandAbilityAnalysisModel;
@class SSForuClerkAnalysisModel;
const static CGFloat kSSPolarChartMixedCellHeight = 311;

@interface SSPolarChartMixedCell : UITableViewCell

- (void)setUiWithModel:(SSBrandAbilityAnalysisModel *)model;
- (void)setAnalysisUiWithModel:(SSForuClerkAnalysisModel *)model;

@end

NS_ASSUME_NONNULL_END
