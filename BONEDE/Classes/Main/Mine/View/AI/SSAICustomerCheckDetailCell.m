//
//  SSAICustomerCheckDetailCell.m
//  BONEDE
//
//  Created by gao lei on 2019/5/29.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import "SSAICustomerCheckDetailCell.h"
#import "SSAICustomerCheckDetailModel.h"

@interface SSAICustomerCheckDetailCell ()
@property (weak, nonatomic) IBOutlet UIImageView *hederImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UILabel *countLbl;

@end

@implementation SSAICustomerCheckDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUIWithModel:(SSAICustomerCheckDetailModel *)model {
    kSDLoadImg(_hederImgV, kMeUnNilStr(model.header_pic));
    _nameLbl.text = kMeUnNilStr(model.name);
    _timeLbl.text = kMeUnNilStr(model.created_at);
    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"访问数：%ld次",model.count]];
    NSUInteger firstLoc = [[aString string] rangeOfString:@"："].location + 1;
    NSString *count = [NSString stringWithFormat:@"%ld",model.count];
    NSRange range = NSMakeRange(firstLoc, count.length);
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#55BA34"] range:range];
    _countLbl.attributedText = aString;
}

@end
