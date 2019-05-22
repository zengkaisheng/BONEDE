//
//  SSClerkDiagnosisResultClerkCell.m
//  BONEDE
//
//  Created by hank on 2019/4/16.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSClerkDiagnosisResultClerkCell.h"
#import "SSClerkDiagnosisResultClerkModel.h"

@interface SSClerkDiagnosisResultClerkCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgICon;
@property (weak, nonatomic) IBOutlet UILabel *lblsort;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIView *lblCount;
@property (weak, nonatomic) IBOutlet UILabel *lblNum;

@end

@implementation SSClerkDiagnosisResultClerkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUIWithModel:(SSClerkDiagnosisResultClerkModel *)model sort:(NSInteger)sort{
    if(sort>0 && sort<4){
        _imgICon.hidden = NO;
        _lblsort.hidden = YES;
        switch (sort) {
            case 1:{
                _imgICon.image = [UIImage imageNamed:@"icon_brandAi_one"];
            }
                break;
            case 2:{
                _imgICon.image = [UIImage imageNamed:@"icon_brandAi_two"];

            }
                break;
            case 3:{
                _imgICon.image = [UIImage imageNamed:@"icon_brandAi_three"];

            }
                break;
            default:
                break;
        }
    }else{
        _lblsort.hidden = NO;
        _imgICon.hidden = YES;
    }
    _lblsort.text = @(sort).description;
    _lblTitle.text = kMeUnNilStr(model.name);
    _lblNum.text = @(model.member_count).description;
}

@end
