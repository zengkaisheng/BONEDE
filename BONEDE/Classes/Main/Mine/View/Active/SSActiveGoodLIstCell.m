//
//  SSActiveGoodLIstCell.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSActiveGoodLIstCell.h"
#import "SSActiveGoodLIstModel.h"

@interface SSActiveGoodLIstCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGoodId;

@end

@implementation SSActiveGoodLIstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUiwithModle:(SSActiveGoodLIstModel *)model{
    kSDLoadImg(_imgPic, model.images);
    _lblTitle.text = kMeUnArr(model.title);
    _lblGoodId.text = [NSString stringWithFormat:@"商品ID:%@",model.product_id];
}

@end
