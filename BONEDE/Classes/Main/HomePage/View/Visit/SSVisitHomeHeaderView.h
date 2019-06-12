//
//  SSVisitHomeHeaderView.h
//  BONEDE
//
//  Created by hank on 2018/11/28.
//  Copyright © 2018年 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSVistorCountModel;
const static CGFloat kSSVisitHomeHeaderViewNewHeight = 455;
const static CGFloat kSSVisitHomeHeaderViewHeight = 265;

@interface SSVisitHomeHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) kMeIndexBlock indexBlock;

+ (CGFloat)getViewHeight;
- (void)setUIWithModel:(SSVistorCountModel *)model;

@end
