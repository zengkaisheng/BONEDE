//
//  SSPosterListVC.m
//  BONEDE
//
//  Created by hank on 2018/11/27.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSPosterListVC.h"
#import "SSPosterContentListVC.h"
#import "SSMyPosterContentListVC.h"
#import "SSEditPosterVC.h"

@interface SSPosterListVC()<JXCategoryViewDelegate,UIScrollViewDelegate>{
    NSArray *_arrType;
    NSInteger _currentType;
}

@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SSPosterContentListVC *listVC;
@property (nonatomic, strong) SSMyPosterContentListVC *activictVC;
@property (nonatomic, strong) SSMyPosterContentListVC *myPostlistVC;//我的上传
@property (nonatomic, strong) SSMyPosterContentListVC *mylistVC;
@property (nonatomic, strong) UIView         *bottomView;
@end

@implementation SSPosterListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"海报";
    _currentType = 0;
    _arrType = @[@"海报列表",@"活动海报",@"我的上传",@"我的分享"];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *_arrType.count,  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addSubview:self.listVC.view];
    [self.scrollView addSubview:self.activictVC.view];
    [self.scrollView addSubview:self.myPostlistVC.view];
    [self.scrollView addSubview:self.mylistVC.view];
    [self.view addSubview:self.scrollView];
    
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, kCategoryViewHeight)];
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineWidth = 55 *kMeFrameScaleX();
    lineView.indicatorLineViewColor =  [UIColor colorWithHexString:@"333333"];
    lineView.indicatorLineViewHeight = 2;
    self.categoryView.indicators = @[lineView];
    //    self.categoryView.lineStyle = JXCategoryLineStyle_None;
    self.categoryView.titles = _arrType;
    self.categoryView.delegate = self;
    self.categoryView.titleSelectedColor = [UIColor colorWithHexString:@"333333"];
    self.categoryView.titleColor =  [UIColor colorWithHexString:@"999999"];
    self.categoryView.contentScrollView = self.scrollView;
//    self.categoryView.indicatorLineWidth = 55 *kMeFrameScaleX();
//    self.categoryView.indicatorLineViewColor = [UIColor colorWithHexString:@"333333"];
//    self.categoryView.indicatorLineViewHeight = 2;
    [self.view addSubview:self.categoryView];
    self.categoryView.defaultSelectedIndex = _currentType;
    
    [self.view addSubview:self.bottomView];
}

- (void)editPoster {
    SSEditPosterVC *editPosterVC = [[SSEditPosterVC alloc] init];
    kMeWEAKSELF
    editPosterVC.finishBlock = ^{
        kMeSTRONGSELF
        [strongSelf.myPostlistVC reloadData];
    };
    [self.navigationController pushViewController:editPosterVC animated:YES];
}

#pragma mark - Setter And Getter

- (SSPosterContentListVC *)listVC{
    if(!_listVC){
        _listVC = [[SSPosterContentListVC alloc]init];
        _listVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _listVC.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90);
        [self addChildViewController:_listVC];
    }
    return _listVC;
}

- (SSMyPosterContentListVC *)activictVC{
    if(!_activictVC){
        _activictVC = [[SSMyPosterContentListVC alloc]initWithActice];
        _activictVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _activictVC.view.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90);
        [self addChildViewController:_activictVC];
    }
    return _activictVC;
}

- (SSMyPosterContentListVC *)myPostlistVC {
    if (!_myPostlistVC) {
        _myPostlistVC = [[SSMyPosterContentListVC alloc] initWithPost];
        _myPostlistVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _myPostlistVC.view.frame = CGRectMake(SCREEN_WIDTH*2,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90);
        [self addChildViewController:_myPostlistVC];
    }
    return _myPostlistVC;
}

- (SSMyPosterContentListVC *)mylistVC{
    if(!_mylistVC){
        _mylistVC = [[SSMyPosterContentListVC alloc]init];
        _mylistVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _mylistVC.view.frame = CGRectMake(SCREEN_WIDTH*3,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90);
        [self addChildViewController:_mylistVC];
    }
    return _mylistVC;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-90, SCREEN_WIDTH, 90)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        //阴影效果
        _bottomView.layer.shadowColor = [UIColor colorWithRed:22/255.0 green:157/255.0 blue:255/255.0 alpha:0.36].CGColor;
        _bottomView.layer.shadowOffset = CGSizeMake(0,0);
        _bottomView.layer.shadowOpacity = 1;
        _bottomView.layer.shadowRadius = 14;
        
        UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [postBtn setFrame:CGRectMake(15, 25, SCREEN_WIDTH - 30, 40)];
        [postBtn setBackgroundColor:[UIColor colorWithHexString:@"#169DFF"]];
        [postBtn setTitle:@"  上传海报" forState:UIControlStateNormal];
        [postBtn.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Bold" size:16]];
        [postBtn setImage:[UIImage imageNamed:@"icon_edit"] forState:UIControlStateNormal];
        [postBtn addTarget:self action:@selector(editPoster) forControlEvents:UIControlEventTouchUpInside];
        postBtn.layer.cornerRadius = 20;
        postBtn.layer.shadowColor = [UIColor colorWithRed:22/255.0 green:157/255.0 blue:255/255.0 alpha:0.36].CGColor;
        postBtn.layer.shadowOffset = CGSizeMake(0,3);
        postBtn.layer.shadowOpacity = 1;
        postBtn.layer.shadowRadius = 10;
        [_bottomView addSubview:postBtn];
    }
    return _bottomView;
}

@end
