//
//  SSHomeTestCell.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    SSHomeTestCellCotentType = 0,
    SSHomeTestListCell,
    SSHomeTestHistoryCell,
} SSHomeTestCellType;


const static CGFloat kSSHomeTestCellHeight = 80;

@interface SSHomeTestCell : UITableViewCell

- (void)setUIWIithType:(SSHomeTestCellType)type;

@end

NS_ASSUME_NONNULL_END
