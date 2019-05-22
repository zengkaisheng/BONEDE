//
//  SSFourHomeWorkShowCell.h
//  BONEDE
//
//  Created by hank on 2019/4/12.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSFourHomeModel;
const static CGFloat kSSFourHomeWorkShowCellHeight = 939;

@interface  SSFourHomeWorkShowCell: UITableViewCell


- (void)setUIWithModel:(SSFourHomeModel *)model;
@property (nonatomic, copy) kMeBasicBlock planAchieveBlock;
@property (nonatomic, copy) kMeBasicBlock workFinishBlock;
@property (nonatomic, copy) kMeBasicBlock workShowBlock;

@property (nonatomic, copy) kMeBasicBlock workShowShareBlock;
@property (nonatomic, copy) kMeBasicBlock workShowChatBlock;
@property (nonatomic, copy) kMeBasicBlock workShowTaskBlock;
@property (nonatomic, copy) kMeBasicBlock workShowCustomerBlock;

@end

NS_ASSUME_NONNULL_END
