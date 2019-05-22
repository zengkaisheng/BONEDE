//
//  SSMineActiveListVC.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSMineActiveListVC.h"
#import "SSMineBargainContentVC.h"
#import "SSMineSignInContentVC.h"
#import "SSMineBargainVC.h"
#import "SSMineSignInVC.h"

@interface SSMineActiveListVC ()<JXCategoryViewDelegate,UIScrollViewDelegate>{
    NSArray *_arrType;
    NSInteger _currentType;
}
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SSMineBargainContentVC *bargainVC;
@property (nonatomic, strong) SSMineSignInContentVC *signInVC;
@property (nonatomic, strong) UIButton *btnAdd;

@end

@implementation SSMineActiveListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动管理";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    _arrType = @[@"签到",@"砍价"] ;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSActiveBootomHeight)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *_arrType.count,  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSActiveBootomHeight);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addSubview:self.signInVC.view];
    [self.scrollView addSubview:self.bargainVC.view];
 
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, kCategoryViewHeight)];
    self.categoryView.backgroundColor = [UIColor whiteColor];
    //    self.categoryView.lineStyle = JXCategoryLineStyle_None;
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = kSSPink;
    self.categoryView.indicators = @[lineView];
    
    self.categoryView.titles = _arrType;
    self.categoryView.delegate = self;
    self.categoryView.titleSelectedColor = kSSPink;
    self.categoryView.contentScrollView = self.scrollView;
    [self.view addSubview:self.categoryView];
    self.categoryView.defaultSelectedIndex = _currentType;
    
    UIView *viewForBottom = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-kSSActiveBootomHeight, SCREEN_WIDTH, kSSActiveBootomHeight)];
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(16, 10, SCREEN_WIDTH-32, 47);
    _btnAdd.backgroundColor = kSSPink;
    [_btnAdd setTitle:@"发起活动" forState:UIControlStateNormal];
    _btnAdd.cornerRadius =2;
    _btnAdd.clipsToBounds = YES;
    [_btnAdd addTarget:self action:@selector(addGoodAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewForBottom addSubview:_btnAdd];
    [self.view addSubview:viewForBottom];
    
}

- (void)addGoodAction:(UIButton*)btn{
    kMeWEAKSELF
    if(self.categoryView.selectedIndex == 1){
        //砍价
        SSMineBargainVC *vc = [[SSMineBargainVC alloc]init];
        vc.finishBlock = ^{
            kMeSTRONGSELF
            [strongSelf.bargainVC reloadNetData];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        //签到
        SSMineSignInVC *vc = [[SSMineSignInVC alloc]init];
        vc.finishBlock = ^{
            kMeSTRONGSELF
            [strongSelf.signInVC reloadNetData];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (SSMineSignInContentVC *)signInVC{
    if(!_signInVC){
        _signInVC = [[SSMineSignInContentVC alloc]init];
        _signInVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _signInVC.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSActiveBootomHeight);
        [self addChildViewController:_signInVC];
    }
    return _signInVC;
}

- (SSMineBargainContentVC *)bargainVC{
    if(!_bargainVC){
        _bargainVC = [[SSMineBargainContentVC alloc]init];
        _bargainVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _bargainVC.view.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSActiveBootomHeight);
        [self addChildViewController:_bargainVC];
    }
    return _bargainVC;
}




@end
