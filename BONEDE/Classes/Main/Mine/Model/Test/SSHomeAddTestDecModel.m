//
//  SSHomeAddTestDecModel.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeAddTestDecModel.h"


@implementation SSHomeAddTestDecResultModel
SSModelIdToIdField
@end
//@implementation SSHomeAddTestDecImageModel
//
//@end
@implementation SSHomeAddTestDecContentModel
SSModelIdToIdField
@end
@implementation SSHomeAddTestDecModel
SSModelIdToIdField
SSModelObjectClassInArrayWithDic((@{@"questions" : [SSHomeAddTestDecContentModel class],@"answers" : [SSHomeAddTestDecResultModel class]}))

- (NSMutableArray *)questions{
    if(!_questions){
        _questions = [NSMutableArray array];
    }
    return _questions;
}
- (NSMutableArray *)answers{
    if(!_answers){
        _answers = [NSMutableArray array];
    }
    return _answers;
}

@end
