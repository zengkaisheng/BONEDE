//
//  SSHomeMainCell.h
//  BONEDE
//
//  Created by hank on 2018/9/7.
//  Copyright © 2018年 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSHomeMainCell : UITableViewCell
//product
- (void)setUIWithArr:(NSArray *)arrModel;
//service
- (void)setServiceUIWithArr:(NSArray *)arrModel;
+ (CGFloat)getCellHeightWithArrModel:(NSArray *)arrModel;
+ (CGFloat)getServiceCellHeightWithArrModel:(NSArray *)arrModel;
@property (weak, nonatomic) IBOutlet UIImageView *imgMainPic;
@property (nonatomic, copy) kMeIndexBlock indexBlock;

@property (nonatomic, copy) kMeBasicBlock imgTouchBlock;

@end
