//
//  SSFourHomeDairyCell.m
//  BONEDE
//
//  Created by hank on 2019/4/12.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSFourHomeDairyCell.h"

@interface SSFourHomeDairyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;


@end

@implementation SSFourHomeDairyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)setUIWithType:(NSInteger)type{
    if(type == 1){
        _imgPic.image = [UIImage imageNamed:@"homeTask"];
    }else if(type == 2){
        _imgPic.image = [UIImage imageNamed:@"homeWork"];
    }else{
        _imgPic.image = [UIImage imageNamed:@"homeCustomer"];
    }
}


@end
