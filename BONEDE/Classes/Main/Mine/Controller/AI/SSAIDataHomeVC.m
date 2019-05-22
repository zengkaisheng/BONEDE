//
//  SSAIDataHomeVC.m
//  SS时代
//
//  Created by hank on 2019/4/9.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSAIDataHomeVC.h"
#import "SSAIDataHomeTimeVC.h"
#import "SSNavigationVC.h"
#import "SSAIDataHomePeopleVC.h"
#import "SSAIDataHomeActiveVC.h"
#import "SSPAVistorVC.h"
@interface SSAIDataHomeVC ()<JXCategoryViewDelegate,UIScrollViewDelegate>{
    NSArray *_arrType;
    NSInteger _currentType;
}

@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) SSAIDataHomeTimeVC *timeVC;
@property (nonatomic, strong) SSAIDataHomeActiveVC *activeVC;
@property (nonatomic, strong) SSAIDataHomePeopleVC *pepleVC;
//@property (nonatomic, strong) SSPAVistorVC *paVC;
//@property (nonatomic, strong) SSPAVistorVC *tpVC;
@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation SSAIDataHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    _arrType = @[@"时间",@"行为",@" 人 "];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *_arrType.count,  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addSubview:self.timeVC.view];
    [self.scrollView addSubview:self.activeVC.view];
    [self.scrollView addSubview:self.pepleVC.view];
//    [self.scrollView addSubview:self.paVC.view];
//    [self.scrollView addSubview:self.tpVC.view];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, kCategoryViewHeight)];
//    self.categoryView.cellWidth = (SCREEN_WIDTH/4);
    self.categoryView.cellSpacing = 0;
    self.categoryView.backgroundColor = [UIColor whiteColor];

    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineWidth = 40;
    lineView.indicatorLineViewColor = kSS333333;
    lineView.indicatorLineViewHeight = 2;
    self.categoryView.indicators = @[lineView];
    
    self.categoryView.titles = _arrType;
    self.categoryView.delegate = self;
    self.categoryView.titleSelectedColor = kSS333333;
    self.categoryView.titleColor = kSS333333;
    self.categoryView.contentScrollView = self.scrollView;
    [self.view addSubview:self.categoryView];
    self.categoryView.defaultSelectedIndex = _currentType;
    
}


//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    SSNavigationVC *nav = (SSNavigationVC *)self.navigationController;
//    nav.canDragBack = NO;
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    SSNavigationVC *nav = (SSNavigationVC *)self.navigationController;
//    nav.canDragBack = YES;;
//}

- (SSAIDataHomeTimeVC *)timeVC{
    if(!_timeVC){
        _timeVC = [[SSAIDataHomeTimeVC alloc]init];
        _timeVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _timeVC.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
        [self addChildViewController:_timeVC];
    }
    return _timeVC;
}

- (SSAIDataHomeActiveVC *)activeVC{
    if(!_activeVC){
        _activeVC = [[SSAIDataHomeActiveVC alloc]init];
        _activeVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _activeVC.view.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
        [self addChildViewController:_activeVC];
    }
    return _activeVC;
}

- (SSAIDataHomePeopleVC *)pepleVC{
    if(!_pepleVC){
        _pepleVC = [[SSAIDataHomePeopleVC alloc]init];
        _pepleVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _pepleVC.view.frame = CGRectMake(SCREEN_WIDTH*2,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
        [self addChildViewController:_pepleVC];
    }
    return _pepleVC;
}

//- (SSPAVistorVC *)paVC{
//    if(!_paVC){
//        _paVC = [[SSPAVistorVC alloc]init];
//        _paVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        _paVC.view.frame = CGRectMake(SCREEN_WIDTH*3,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
//        [self addChildViewController:_paVC];
//    }
//    return _paVC;
//}

//- (SSPAVistorVC *)tpVC{
//    if(!_tpVC){
//        _tpVC = [[SSPAVistorVC alloc]init];
//        _tpVC.followUpMember = YES;
//        _tpVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        _tpVC.view.frame = CGRectMake(SCREEN_WIDTH*4,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
//        [self addChildViewController:_tpVC];
//    }
//    return _tpVC;
//}

@end
