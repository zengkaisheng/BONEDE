//
//  SSPAManngerCell.m
//  BONEDE
//
//  Created by hank on 2019/5/15.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSPAManngerCell.h"
#import "SSPAManngerVC.h"
#import "SSPosterListVC.h"
#import "SSArticelVC.h"
#import "SSVisiterHomeVC.h"
//#import "SSPAVistorVC.h"
#import "SSPNewAVistorVC.h"
@implementation SSPAManngerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)huokehaibaoAction:(UIButton *)sender {
    SSPAManngerVC *homeVc = (SSPAManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSPAManngerVC class] targetResponderView:self];
    if(homeVc){
        SSPosterListVC *mobile = [[SSPosterListVC alloc]init];
        [homeVc.navigationController pushViewController:mobile animated:YES];
    }
}

- (IBAction)huokewenzhanAction:(UIButton *)sender {
    SSPAManngerVC *homeVc = (SSPAManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSPAManngerVC class] targetResponderView:self];
    if(homeVc){
        SSArticelVC *mobile = [[SSArticelVC alloc]init];
        [homeVc.navigationController pushViewController:mobile animated:YES];
    }
}

- (IBAction)visterDataAction:(UIButton *)sender {
    SSPAManngerVC *homeVc = (SSPAManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSPAManngerVC class] targetResponderView:self];
    if(homeVc){
        SSVisiterHomeVC *mobile = [[SSVisiterHomeVC alloc]init];
        [homeVc.navigationController pushViewController:mobile animated:YES];
    }
}

- (IBAction)paAction:(UIButton *)sender {
    SSPAManngerVC *homeVc = (SSPAManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSPAManngerVC class] targetResponderView:self];
    if(homeVc){
        SSPNewAVistorVC *vc = [[SSPNewAVistorVC alloc]init];
        [homeVc.navigationController pushViewController:vc animated:YES];
    }
}


@end
