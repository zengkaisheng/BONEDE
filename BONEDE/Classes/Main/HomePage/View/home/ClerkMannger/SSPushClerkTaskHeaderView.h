//
//  SSPushClerkTaskHeaderView.h
//  BONEDE
//
//  Created by hank on 2019/5/15.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSPushClerkTaskHeaderViewHeight = 44;


@interface SSPushClerkTaskHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) kMeBasicBlock tapBlock;

@end

NS_ASSUME_NONNULL_END
