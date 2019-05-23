//
//  SSAIDataHomeVC.m
//  SS时代
//
//  Created by hank on 2019/4/9.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSAIDataHomeVC.h"
#import "SSAIDataHomeTimeVC.h"
#import "SSAIDataHomePeopleVC.h"
#import "SSAIDataHomeActiveVC.h"
//#import "SSNavigationVC.h"
//#import "SSPAVistorVC.h"
#import "ViewPagerTitleButton.h"
#import "SSPNewAVistorVC.h"

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

@property (nonatomic, strong) SSPNewAVistorVC *PNewAVistorVC;
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UIScrollView *backScrollView;

@end

@implementation SSAIDataHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    //顶部view
    [self initTitleView];
    
    //外部ScrollView
    self.backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight)];
    self.backScrollView.delegate = self;
    self.backScrollView.pagingEnabled = NO;
    self.backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2,  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
    self.backScrollView.bounces = NO;
    self.backScrollView.scrollEnabled = NO;
    self.backScrollView.showsVerticalScrollIndicator = NO;
    self.backScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.backScrollView];
    self.backScrollView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    
    //小程序跟踪view
    self.BGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight)];
//    self.BGView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    self.BGView.backgroundColor = [UIColor redColor];
    
    //小程序内部view
    _arrType = @[@"时间",@"行为",@" 人 "];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *(_arrType.count),  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addSubview:self.timeVC.view];
    [self.scrollView addSubview:self.activeVC.view];
    [self.scrollView addSubview:self.pepleVC.view];
//    [self.scrollView addSubview:self.paVC.view];
//    [self.scrollView addSubview:self.tpVC.view];
    [self.BGView addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kCategoryViewHeight)];
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
    [self.BGView addSubview:self.categoryView];
    self.categoryView.defaultSelectedIndex = _currentType;
    
    [self.backScrollView addSubview:self.BGView];
    [self.backScrollView addSubview:self.PNewAVistorVC.view];
}

- (void)initTitleView {
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight, SCREEN_WIDTH, kCategoryViewHeight)];
    titleView.backgroundColor = [UIColor whiteColor];
    
    ViewPagerTitleButton *btn1 = [self createButtonWithTitle:@"小程序跟踪" andTag:300 frame:CGRectMake(0, 0, SCREEN_WIDTH/2, kCategoryViewHeight)];
    btn1.selected = YES;
    ViewPagerTitleButton *btn2 = [self createButtonWithTitle:@"获客图文跟踪" andTag:301 frame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, kCategoryViewHeight)];
    [titleView addSubview:btn1];
    [titleView addSubview:btn2];
    [self.view addSubview:titleView];
}

- (ViewPagerTitleButton *)createButtonWithTitle:(NSString *)title andTag:(NSInteger)tag frame:(CGRect)frame{
    ViewPagerTitleButton *btn = [[ViewPagerTitleButton alloc] init];
    btn.frame = frame;
    btn.width = 60.0f;
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kSS333333 forState:UIControlStateNormal];
    [btn setTitleColor:kSS333333 forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(topBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)topBtnDidClick:(UIButton *)sender {
    [self.view endEditing:YES];
    if (sender.tag == 300 && sender.selected == NO) {
        [self.backScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (sender.tag == 301 && sender.selected == NO) {
        [self.backScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    }
    
    UIView *superView = sender.superview;
    for (UIView *view in superView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            btn.selected = NO;
        }
    }
    sender.selected = YES;
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

- (SSPNewAVistorVC *)PNewAVistorVC {
    if (!_PNewAVistorVC) {
        _PNewAVistorVC = [[SSPNewAVistorVC alloc]init];
        _PNewAVistorVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _PNewAVistorVC.view.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kMeTabBarHeight);
        [self addChildViewController:_PNewAVistorVC];
    }
    return _PNewAVistorVC;
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
