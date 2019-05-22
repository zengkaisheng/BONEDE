//
//  SSHomeAddTestResultCell.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeAddTestResultCell.h"
#import "SSHomeAddTestDecModel.h"

@interface SSHomeAddTestResultCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblLevle;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UIButton *btnAddPhoto;


@end

@implementation SSHomeAddTestResultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (IBAction)addPhotoAction:(UIButton *)sender {
    kMeCallBlock(_addPhotoBlock);
}

- (void)setUiWIthModel:(SSHomeAddTestDecResultModel *)model index:(NSInteger)index type:(SSHomeAddTestDecTypeVC)type;{
    _lblLevle.text = [NSString stringWithFormat:@"分值阶段%@",@(index+1)];
    _lblScore.text = [NSString stringWithFormat:@"%@~%@",@(model.min),@(model.max)];
    if(kMeUnNilStr(model.answer).length){
        kSDLoadImg(_imgPic, SSLoadAddQiniuImagesWithUrl(model.answer));
    }else{
        _imgPic.image = nil;
    }
    _btnAddPhoto.hidden = type == SSHomeAddTestDecTypelplatVC;

}


@end
