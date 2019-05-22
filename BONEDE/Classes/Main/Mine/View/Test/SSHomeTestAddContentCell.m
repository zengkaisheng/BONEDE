//
//  SSHomeTestAddContentCell.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeTestAddContentCell.h"
#import "SSHomeAddTestDecModel.h"
#import "SSBlockTextField.h"
@interface SSHomeTestAddContentCell()
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTitle;

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfA;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfB;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfC;
@property (weak, nonatomic) IBOutlet SSBlockTextField *tfD;

@property (nonatomic, strong) SSHomeAddTestDecContentModel *model;
@end
@implementation SSHomeTestAddContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)setUiWithModel:(SSHomeAddTestDecContentModel *)model{
    _model = model;
    kMeWEAKSELF
    _tfTitle.text = kMeUnNilStr(model.content);
    _tfTitle.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.content = kMeUnNilStr(str);
    };
    
    _tfA.text = kMeUnNilStr(model.option1);
    _tfA.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.option1 = kMeUnNilStr(str);
    };
    
    _tfB.text = kMeUnNilStr(model.option2);
    _tfB.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.option2 = kMeUnNilStr(str);
    };
    
    _tfC.text = kMeUnNilStr(model.option3);
    _tfC.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.option3 = kMeUnNilStr(str);
    };
    
    _tfD.text = kMeUnNilStr(model.option4);
    _tfD.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.option4 = kMeUnNilStr(str);
    };
}

@end
