//
//  SSClerkTaskDetailCell.h
//  BONEDE
//
//  Created by hank on 2019/4/16.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSClerkTaskDetailModel;
const static CGFloat kSSClerkTaskDetailCellHeight = 172;

@interface SSClerkTaskDetailCell : UITableViewCell
- (void)setUIWIthModel:(SSClerkTaskDetailModel *)model;
+ (CGFloat)getCellHeightWithModel:(SSClerkTaskDetailModel *)model;

@property (nonatomic , copy) kMeBasicBlock checkLogBlock;

@end

NS_ASSUME_NONNULL_END
