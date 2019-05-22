//
//  SSHomeAddTestDecCell.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSHomeAddTestDecModel;
const static CGFloat kSSHomeAddTestDecCellHeight = 416;

@interface SSHomeAddTestDecCell : UITableViewCell

@property (nonatomic,copy)kMeBasicBlock addPhotoBlcok;

- (void)setUIWIthModel:(SSHomeAddTestDecModel *)model;

@end

NS_ASSUME_NONNULL_END
