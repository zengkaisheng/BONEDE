//
//  SSBdataLineCell.h
//  BONEDE
//
//  Created by hank on 2019/3/20.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSBdataLineCellHeight = 413;

@interface SSBdataLineCell : UITableViewCell
- (void)setUiWithTitleArr:(NSArray *)arr NumArr:(NSArray*)numArr;
@end

NS_ASSUME_NONNULL_END