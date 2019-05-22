//
//  SSActiveGoodLIstCell.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSActiveGoodLIstModel;
const static CGFloat kSSActiveGoodLIstCellHeight = 65;

@interface SSActiveGoodLIstCell : UITableViewCell

- (void)setUiwithModle:(SSActiveGoodLIstModel *)model;

@end

NS_ASSUME_NONNULL_END
