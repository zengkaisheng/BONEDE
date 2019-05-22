//
//  SSHomeAddTestSubjectVC.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseVC.h"

NS_ASSUME_NONNULL_BEGIN
@class SSHomeAddTestDecModel;
@interface SSHomeAddTestSubjectVC : SSBaseVC
@property (nonatomic,copy)NSString *token;
- (instancetype)initWithModel:(SSHomeAddTestDecModel *)model;
@property (nonatomic,assign)SSHomeAddTestDecTypeVC type;
@end

NS_ASSUME_NONNULL_END
