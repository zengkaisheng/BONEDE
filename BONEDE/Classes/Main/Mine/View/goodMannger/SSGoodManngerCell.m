//
//  SSGoodManngerCell.m
//  BONEDE
//
//  Created by hank on 2019/3/27.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSGoodManngerCell.h"
#import "SSGoodManngerModel.h"
#import "SSMineBargainContentModel.h"
#import "SSMineSignInContentModel.h"

@interface SSGoodManngerCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblGoodId;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblsort;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblSaled;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;



@end

@implementation SSGoodManngerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUiWithModel:(SSGoodManngerModel *)model{
    _lblGoodId.text = [NSString stringWithFormat:@"商品ID:%@",kMeUnNilStr(model.product_id)];
    kSDLoadImg(_imgPic, kMeUnNilStr(model.images));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblsort.text = kMeUnNilStr(model.category_name);
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(kMeUnNilStr(model.money).floatValue)];
    _lblSaled.text = [NSString stringWithFormat:@"销量:%@",kMeUnNilStr(model.sales)];
    _lblTime.text =[NSString stringWithFormat:@"创建时间:%@",kMeUnNilStr(model.updated_at)];
}

- (void)setBargainUiWithModel:(SSMineBargainContentModel *)model{
    _lblGoodId.text = [NSString stringWithFormat:@"活动ID:%@",kMeUnNilStr(model.idField)];
    kSDLoadImg(_imgPic, kMeUnNilStr(model.images));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblsort.text = kMeUnNilStr(model.desc);
    _lblPrice.text = [NSString stringWithFormat:@"¥%@",@(kMeUnNilStr(model.amount_money).floatValue)];
    
    _lblSaled.text = [NSString stringWithFormat:@"需砍次数:%@",kMeUnNilStr(model.bargin_num)];
   _lblTime.text =[NSString stringWithFormat:@"创建时间:%@",kMeUnNilStr(model.updated_at)];
}

- (void)setSingnInUiWithModel:(SSMineSignInContentModel *)model{
    _lblGoodId.text = [NSString stringWithFormat:@"活动ID:%@",kMeUnNilStr(model.idField)];
    kSDLoadImg(_imgPic, kMeUnNilStr(model.image_url));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblsort.text = [NSString stringWithFormat:@"开奖时间:%@",kMeUnNilStr(model.end_time)];
    
    _lblPrice.text = [NSString stringWithFormat:@"%@份",kMeUnNilStr(model.total)];
    _lblSaled.text = [NSString stringWithFormat:@"状态:%@",model.status == 2?@"已开奖":@"未开奖"];
    _lblTime.text =[NSString stringWithFormat:@"创建时间:%@",kMeUnNilStr(model.created_at)];
}

- (IBAction)delAction:(UIButton *)sender {
    kMeCallBlock(_delBlock);
}

@end
