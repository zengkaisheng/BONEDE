//
//  SSMineSignInCell.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSMineSignInParModel;
const static CGFloat kSSMineSignInCellHeight = 361;

@interface SSMineSignInCell : UITableViewCell
- (void)setUiWithModel:(SSMineSignInParModel *)model;
@end

NS_ASSUME_NONNULL_END
