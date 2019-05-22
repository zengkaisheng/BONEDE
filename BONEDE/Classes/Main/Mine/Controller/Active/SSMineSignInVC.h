//
//  SSMineSignInVC.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSMineSignInVC : SSBaseVC

@property (nonatomic,copy)kMeBasicBlock finishBlock;
- (instancetype)initWithActiveId:(NSString *)activeId;
@end

NS_ASSUME_NONNULL_END
