//
//  SSClerkWorkStatisticsServerLogCell.h
//  BONEDE
//
//  Created by hank on 2019/4/16.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SSClerkWorkStatisticsServerLogModel;
const static CGFloat kSSClerkWorkStatisticsServerLogCellHeight = 152;

@interface SSClerkWorkStatisticsServerLogCell : UITableViewCell
- (void)setUiWIthMOdel:(SSClerkWorkStatisticsServerLogModel *)model;
@end

NS_ASSUME_NONNULL_END
