//
//  SSServiceDetailsBottomView.m
//  BONEDE
//
//  Created by hank on 2018/9/14.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSServiceDetailsBottomView.h"
#import "SSServiceDetailsVC.h"
#import "SSStoreHomeVC.h"
#import "SSHomePageVC.h"
#import "SSMidelButton.h"

@interface SSServiceDetailsBottomView()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *consPurchaseWdith;
@property (weak, nonatomic) IBOutlet SSMidelButton *btnShare;

@end

@implementation SSServiceDetailsBottomView

- (void)awakeFromNib{
    [super awakeFromNib];
    _consPurchaseWdith.constant = 226 * kMeFrameScaleX();
    _btnShare.hidden = ![WXApi isWXAppInstalled];
}

- (IBAction)homeAction:(UIButton *)sender {
    SSServiceDetailsVC *detailVC = (SSServiceDetailsVC *)[SSCommonTool getVCWithClassWtihClassName:[SSServiceDetailsVC class] targetResponderView:self];
    if(detailVC){
        detailVC.tabBarController.selectedIndex = 0;
        [detailVC.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)shareWxFriendAction:(UIButton *)sender {
    if([SSUserInfoModel isLogin]){
        [self sharAction];
    }else{
        kMeWEAKSELF
        [SSWxLoginVC presentLoginVCWithSuccessHandler:^(id object) {
            kMeSTRONGSELF
            [strongSelf sharAction];
        } failHandler:nil];
    }
}

- (void)sharAction{
    SSShareTool *shareTool = [SSShareTool me_instanceForTarget:self];
    shareTool.sharWebpageUrl = SSIPShare;
#warning -- 分享标题
    shareTool.shareTitle = @"棒的APP";
    shareTool.shareDescriptionBody = @"棒的APP";
    shareTool.shareImage = kMeGetAssetImage(@"icon-wgvilogo");
    
    [shareTool shareWebPageToPlatformType:UMSocialPlatformType_WechatSession success:^(id data) {
        NSLog(@"分享成功%@",data);
        [SSPublicNetWorkTool postAddShareWithSuccessBlock:nil failure:nil];
        [SSShowViewTool showMessage:@"分享成功" view:kMeCurrentWindow];
    } failure:^(NSError *error) {
        NSLog(@"分享失败%@",error);
        [SSShowViewTool showMessage:@"分享失败" view:kMeCurrentWindow];
    }];
}

//- (IBAction)shareWxFriendAction:(UIButton *)sender {
//
//}
//
//- (IBAction)shareWxCrial:(UIButton *)sender {
//
//}

- (IBAction)appointAction:(UIButton *)sender {
    kMeCallBlock(_appointMentBlock);
}

- (IBAction)customAction:(UIButton *)sender {
    kMeCallBlock(self.customBlock);
}

@end
