//
//  SSUploadArticelCell.m
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSUploadArticelCell.h"
#import "SSArticelModel.h"

@interface SSUploadArticelCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;

@end

@implementation SSUploadArticelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _lblSubTitle.adjustsFontSizeToFitWidth = YES;
    _lblTitle.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:15];
}

- (void)setUIWithModel:(SSArticelModel *)model{
    kSDLoadImg(_imgPic, kMeUnNilStr(model.images_url));
    _lblTitle.text = kMeUnNilStr(model.title);
    _lblSubTitle.text = [NSString stringWithFormat:@"阅读量 %@ %@",@(model.read).description,kMeUnNilStr(model.updated_at)];
}


@end
