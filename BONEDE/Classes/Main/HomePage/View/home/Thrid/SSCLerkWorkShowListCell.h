//
//  SSCLerkWorkShowListCell.h
//  BONEDE
//
//  Created by hank on 2019/5/17.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSCLerkWorkShowListModel;

const static CGFloat kSSCLerkWorkShowListCellHeight = 65;

@interface SSCLerkWorkShowListCell : UITableViewCell

- (void)setUiWithType:(SSCLerkWorkShowListType)type model:(SSCLerkWorkShowListModel*)model;

@end

NS_ASSUME_NONNULL_END
