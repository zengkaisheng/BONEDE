//
//  SSMineBargainCell.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSMineAddBargainParModel;
const static CGFloat kSSMineBargainCellHeight = 676;

@interface SSMineBargainCell : UITableViewCell

- (void)setUiWithModel:(SSMineAddBargainParModel *)model;

@end

NS_ASSUME_NONNULL_END
