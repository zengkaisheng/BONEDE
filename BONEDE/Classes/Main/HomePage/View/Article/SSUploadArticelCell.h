//
//  SSUploadArticelCell.h
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SSArticelModel;
const static CGFloat kSSUploadArticelCellheight = 111;

@interface SSUploadArticelCell : UITableViewCell

- (void)setUIWithModel:(SSArticelModel *)model;

@end

NS_ASSUME_NONNULL_END
