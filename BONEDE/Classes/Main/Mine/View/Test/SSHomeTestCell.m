//
//  SSHomeTestCell.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeTestCell.h"

@interface SSHomeTestCell ()
{
    NSArray *_arrImg;
    NSArray *_arrTitle;

}
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation SSHomeTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _arrImg = @[@"testCu",@"testlist",@"testHostory"];
    _arrTitle = @[@"自定义测试内容",@"选择测试题库",@"历史发布测试题库"];
    self.selectionStyle = 0;
}

- (void)setUIWIithType:(SSHomeTestCellType)type{
    _imgPic.image = [UIImage imageNamed:_arrImg[type]];
    _lblTitle.text = kMeUnNilStr(_arrTitle[type]);
}

@end
