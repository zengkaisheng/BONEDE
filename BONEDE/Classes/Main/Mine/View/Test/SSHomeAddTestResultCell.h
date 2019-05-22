//
//  SSHomeAddTestResultCell.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSHomeAddTestDecResultModel;
const static CGFloat kSSHomeAddTestResultCellHeight = 364;

@interface SSHomeAddTestResultCell : UITableViewCell

@property (nonatomic,copy)kMeBasicBlock addPhotoBlock;
- (void)setUiWIthModel:(SSHomeAddTestDecResultModel *)model index:(NSInteger)index type:(SSHomeAddTestDecTypeVC)type;;
@end

NS_ASSUME_NONNULL_END
