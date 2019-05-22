//
//  SSHomeAddTestSubjectContentCell.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SSHomeAddTestDecContentModel;

@interface SSHomeAddTestSubjectContentCell : UICollectionViewCell
@property (nonatomic,copy)kMeBasicBlock forBlock;
@property (nonatomic,copy)kMeBasicBlock nextBlock;
@property (nonatomic,copy)kMeBasicBlock addTextBlock;
- (void)setUIWithModel:(SSHomeAddTestDecContentModel*)model index:(NSInteger)index type:(SSHomeAddTestDecTypeVC)type;

@end

NS_ASSUME_NONNULL_END
