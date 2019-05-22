//
//  SSForuClerkAnalysisModel.h
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSForuClerkAnalysisModel : SSBaseModel

@property (nonatomic, assign) CGFloat customer_num;
@property (nonatomic, assign) CGFloat interaction_num;
@property (nonatomic, assign) CGFloat potential_customer_num;
@property (nonatomic, assign) CGFloat share_article_num;
@property (nonatomic, assign) CGFloat share_num;
@property (nonatomic, assign) CGFloat share_posters_num;

@end

NS_ASSUME_NONNULL_END
