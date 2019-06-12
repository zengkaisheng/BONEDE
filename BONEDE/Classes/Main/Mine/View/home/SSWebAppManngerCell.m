//
//  SSWebAppManngerCell.m
//  BONEDE
//
//  Created by hank on 2019/5/15.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSWebAppManngerCell.h"
#import "SSWebAppManngerVC.h"

#import "MEBrandStoryVC.h"
#import "SSGoodManngerVC.h"
#import "SSGetCaseMainSVC.h"
#import "SSMySelfExtractionOrderVC.h"
#import "SSBStoreMannagerVC.h"
#import "SSProductShoppingCartVC.h"
#import "SSMineActiveListVC.h"
#import "SSHomeTestVC.h"
@interface SSWebAppManngerCell ()

@property (weak, nonatomic) IBOutlet UIView *testView;


@end

@implementation SSWebAppManngerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
    _testView.hidden  = YES;
}

- (IBAction)brandStoryAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        MEBrandStoryVC *brandVC = [[MEBrandStoryVC alloc]init];
        [homeVc.navigationController pushViewController:brandVC animated:YES];
    }
}

- (IBAction)goodManngerAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSGoodManngerVC *brandVC = [[SSGoodManngerVC alloc]init];
        [homeVc.navigationController pushViewController:brandVC animated:YES];
    }

}

- (IBAction)tixianAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSGetCaseMainSVC *vc = [[SSGetCaseMainSVC alloc]initWithType:SSGetCaseAllStyle];
        [homeVc.navigationController pushViewController:vc animated:YES];
    }

}

- (IBAction)zitiorderAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSMySelfExtractionOrderVC *orderVC = [[SSMySelfExtractionOrderVC alloc]init];
        [homeVc.navigationController pushViewController:orderVC animated:YES];
    }
}

- (IBAction)dianpuManngerAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSBStoreMannagerVC *storeVC = [[SSBStoreMannagerVC alloc]init];
        [homeVc.navigationController pushViewController:storeVC animated:YES];
    }
}

- (IBAction)activeAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSMineActiveListVC *storeVC = [[SSMineActiveListVC alloc]init];
        [homeVc.navigationController pushViewController:storeVC animated:YES];
    }
}

- (IBAction)shopCartAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSProductShoppingCartVC *vc = [[SSProductShoppingCartVC alloc]init];
        [homeVc.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)testAction:(UIButton *)sender {
    SSWebAppManngerVC *homeVc = (SSWebAppManngerVC *)[SSCommonTool getVCWithClassWtihClassName:[SSWebAppManngerVC class] targetResponderView:self];
    if(homeVc){
        SSHomeTestVC *vc = [[SSHomeTestVC alloc]init];
        [homeVc.navigationController pushViewController:vc animated:YES];
    }
}
@end
