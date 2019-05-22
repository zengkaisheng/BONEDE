//
//  SSActiveGoodLIstVC.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSActiveGoodLIstVC : SSBaseVC

//yes 签到 NO 砍价
@property (nonatomic, assign) BOOL isSignIN;

@property (nonatomic,copy)kMeTextBlock selectBlock;

@end

NS_ASSUME_NONNULL_END
