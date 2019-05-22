//
//  SSHomeTestTitleCell.h
//  BONEDE
//
//  Created by hank on 2019/5/21.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSHomeTestTitleModel;
@interface SSHomeTestTitleCell : UITableViewCell

+ (CGFloat)getCellheightWithMolde:(SSHomeTestTitleModel *)model;
- (void)setUIWithModel:(SSHomeTestTitleModel *)model;
@property (weak, nonatomic) IBOutlet UIButton *btnDel;
@property (nonatomic,copy)kMeBasicBlock delBlock;
@property (nonatomic,copy)kMeBasicBlock shareBlock;
@end

NS_ASSUME_NONNULL_END
