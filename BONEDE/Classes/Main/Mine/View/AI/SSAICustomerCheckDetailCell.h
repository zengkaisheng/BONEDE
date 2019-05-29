//
//  SSAICustomerCheckDetailCell.h
//  BONEDE
//
//  Created by gao lei on 2019/5/29.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSAICustomerCheckDetailModel;
NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSAICustomerCheckDetailCellHeight = 65;

@interface SSAICustomerCheckDetailCell : UITableViewCell

- (void)setUIWithModel:(SSAICustomerCheckDetailModel *)model;

@end

NS_ASSUME_NONNULL_END
