//
//  SSHomeAddTestDecModel.h
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface SSHomeAddTestDecResultModel : SSBaseModel
@property (nonatomic, strong) NSString * idField;
@property (nonatomic , strong) NSString *answer;
@property (nonatomic , assign) CGFloat min;
@property (nonatomic , assign) CGFloat max;

@end

//@interface SSHomeAddTestDecImageModel : SSBaseModel
////题目类型 1图片 2文本
//@property (nonatomic , assign) NSInteger type;
//@property (nonatomic , strong) NSString *image;
//@property (nonatomic , strong) NSString *score_a;
//@property (nonatomic , strong) NSString *score_b;
//@property (nonatomic , strong) NSString *score_c;
//@property (nonatomic , strong) NSString *score_d;
//
//@end

@interface SSHomeAddTestDecContentModel : SSBaseModel
//题目类型 1图片 2文本
@property (nonatomic , assign) NSInteger type;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic , strong) NSString *image;
@property (nonatomic , strong) NSString *content;
@property (nonatomic , strong) NSString *option1;
@property (nonatomic , strong) NSString *option2;
@property (nonatomic , strong) NSString *option3;
@property (nonatomic , strong) NSString *option4;
@property (nonatomic , strong) NSString *score_a;
@property (nonatomic , strong) NSString *score_b;
@property (nonatomic , strong) NSString *score_c;
@property (nonatomic , strong) NSString *score_d;
@end

@interface SSHomeAddTestDecModel : SSBaseModel

@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSString *desc;
@property (nonatomic , strong) NSString *image;
//题目类型 1图片 2文本
@property (nonatomic , assign) NSInteger type;
//题库 1图片 SSHomeAddTestDecImageModel 2文本 SSHomeAddTestDecContentModel
@property (nonatomic , strong) NSMutableArray *questions;
//答案
@property (nonatomic , strong) NSMutableArray *answers;
@property (nonatomic, strong) NSString * idField;
@end

NS_ASSUME_NONNULL_END
