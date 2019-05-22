//
//  SSHomeAddTestDecCell.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeAddTestDecCell.h"
#import "SSBlockTextField.h"
#import "SSBlockTextView.h"
#import "SSHomeAddTestDecModel.h"

@interface SSHomeAddTestDecCell ()

@property (weak, nonatomic) IBOutlet SSBlockTextField *tfTitle;
@property (weak, nonatomic) IBOutlet SSBlockTextView *tvContent;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;

@property (strong, nonatomic) SSHomeAddTestDecModel *model;
@end

@implementation SSHomeAddTestDecCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;

}

- (void)setUIWIthModel:(SSHomeAddTestDecModel *)model{
    kMeWEAKSELF
    _model = model;
    _tfTitle.text = kMeUnNilStr(model.title);
    _tfTitle.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.title = kMeUnNilStr(str);
    };
    _tvContent.text = kMeUnNilStr(model.desc);
    _tvContent.contentBlock = ^(NSString *str) {
        kMeSTRONGSELF
        strongSelf.model.desc = kMeUnNilStr(str);
    };
    if(kMeUnNilStr(model.image).length){
        kSDLoadImg(_imgPic, SSLoadAddQiniuImagesWithUrl(model.image));
    }
}

- (IBAction)addPhoto:(UIButton *)sender {
    kMeCallBlock(_addPhotoBlcok);
}

@end
