//
//  SSCLerkWorkShowListCell.m
//  BONEDE
//
//  Created by hank on 2019/5/17.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSCLerkWorkShowListCell.h"
#import "SSCLerkWorkShowListModel.h"

@interface SSCLerkWorkShowListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;

@end

@implementation SSCLerkWorkShowListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setUiWithType:(SSCLerkWorkShowListType)type model:(SSCLerkWorkShowListModel*)model{
    kSDLoadImg(_imgPic, model.header_pic);
    _lblTitle.text = kMeUnNilStr(model.name);
    NSString *str = @"";
    if(type == SSCLerkWorkShowListShareType){
        str = @"分享数:";
    }else if (type == SSCLerkWorkShowListChatType){
        str = @"沟通数:";
    }else if (type == SSCLerkWorkShowListCustomerType){
        str = @"客户数:";
    }else if (type == SSCLerkWorkShowListTaskType){
        str = @"任务数:";
    }
    _lblCount.text = [NSString stringWithFormat:@"%@%@",str,kMeUnNilStr(model.count)];
}

@end
