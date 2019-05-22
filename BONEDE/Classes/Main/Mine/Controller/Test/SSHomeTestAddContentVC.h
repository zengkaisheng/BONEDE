//
//  SSHomeTestAddContentVC.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseVC.h"

NS_ASSUME_NONNULL_BEGIN
@class SSHomeAddTestDecContentModel;
typedef void (^kHomeTestAddContenBlock)(SSHomeAddTestDecContentModel *dic);
//
@interface SSHomeTestAddContentVC : SSBaseVC

@property (nonatomic,copy) kHomeTestAddContenBlock block;
@property (nonatomic, strong) SSHomeAddTestDecContentModel *model;

@end

NS_ASSUME_NONNULL_END
