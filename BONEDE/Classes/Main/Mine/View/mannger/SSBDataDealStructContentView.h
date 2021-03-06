//
//  SSBDataDealStructContentView.h
//  BONEDE
//
//  Created by hank on 2019/2/26.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSBDataDealStructContentViewHeight = 70;
#define kSSBDataDealStructContentViewWdith ((SCREEN_WIDTH-30)/3)

@interface SSBDataDealStructContentView : UIView

@property (nonatomic, strong) UILabel *lblCategory;
@property (nonatomic, strong) UILabel *lblPercent;
@property (nonatomic, strong) UIView *viewRightLine;

@end

NS_ASSUME_NONNULL_END
