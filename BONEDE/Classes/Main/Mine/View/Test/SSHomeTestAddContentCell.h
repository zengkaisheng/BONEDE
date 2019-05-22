//
//  SSHomeTestAddContentCell.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSHomeTestAddContentCellHeight = 256;

@class SSHomeAddTestDecContentModel;
@interface SSHomeTestAddContentCell : UITableViewCell
- (void)setUiWithModel:(SSHomeAddTestDecContentModel *)model;



@end

NS_ASSUME_NONNULL_END
