//
//  SSRCConversationVC.h
//  BONEDE
//
//  Created by hank on 2018/9/29.
//  Copyright © 2018年 hank. All rights reserved.
//



//#import <RongIMKit/RongIMKit.h>
#import "TChatController.h"

@interface SSRCConversationVC : SSBaseVC

@property (nonatomic, assign) BOOL isHideRemindBtn;

- (instancetype)initWIthconversationData:(TConversationCellData *)data;
@end

