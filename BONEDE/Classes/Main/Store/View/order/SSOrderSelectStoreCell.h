//
//  SSOrderSelectStoreCell.h
//  BONEDE
//
//  Created by hank on 2018/9/14.
//  Copyright © 2018年 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

const static CGFloat kSSOrderSelectStoreCellHeight = 73;

@interface SSOrderSelectStoreCell : UITableViewCell

- (void)setUIWithSubtitle:(NSString *)subtitle title:(NSString *)title;

@end