//
//  SSGoodManngerVC.m
//  BONEDE
//
//  Created by hank on 2019/3/27.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSGoodManngerVC.h"
#import "SSGoodManngerContentVC.h"
#import "SSAddGoodVC.h"

@interface SSGoodManngerVC ()<JXCategoryViewDelegate,UIScrollViewDelegate>{
    NSArray *_arrType;
    NSInteger _currentType;
}
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SSGoodManngerContentVC *upVC;
@property (nonatomic, strong) SSGoodManngerContentVC *downVC;
@property (nonatomic, strong) UIButton *btnAdd;

@end

@implementation SSGoodManngerVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品管理";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    _arrType = @[@"已上架(0)",@"已下架(0)"] ;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kCategoryViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSGoodManngerContentVCBootomHeigt)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *_arrType.count,  SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSGoodManngerContentVCBootomHeigt);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addSubview:self.upVC.view];
    [self.scrollView addSubview:self.downVC.view];
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
    
    UIView *viewForBottom = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-kSSGoodManngerContentVCBootomHeigt, SCREEN_WIDTH, kSSGoodManngerContentVCBootomHeigt)];
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(16, 10, SCREEN_WIDTH-32, 47);
    _btnAdd.backgroundColor = kSSPink;
    [_btnAdd setTitle:@"新建商品" forState:UIControlStateNormal];
    _btnAdd.cornerRadius =2;
    _btnAdd.clipsToBounds = YES;
    [_btnAdd addTarget:self action:@selector(addGoodAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewForBottom addSubview:_btnAdd];
    [self.view addSubview:viewForBottom];
    
}

- (void)addGoodAction:(UIButton*)btn{
    SSAddGoodVC *vc = [[SSAddGoodVC alloc]init];
    kMeWEAKSELF
    vc.finishAddBlock = ^{
        kMeSTRONGSELF
        if(strongSelf->_upVC){
            [strongSelf->_upVC reloadNetData];
        }
        if(strongSelf->_downVC){
            [strongSelf->_downVC reloadNetData];
        }
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (SSGoodManngerContentVC *)upVC{
    if(!_upVC){
        _upVC = [[SSGoodManngerContentVC alloc]initWithType:1];
        _upVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _upVC.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSGoodManngerContentVCBootomHeigt);
        kMeWEAKSELF
        _upVC.finishBlock = ^(SSNetListModel *responseObject) {
            kMeSTRONGSELF
            NSString *putaway = [NSString stringWithFormat:@"已上架(%@)",kMeUnNilStr(responseObject.putaway)];
            NSString *soldout = [NSString stringWithFormat:@"已下架(%@)",kMeUnNilStr(responseObject.soldout)];
            strongSelf.categoryView.titles = @[putaway,soldout];
            [strongSelf.categoryView reloadData];
        };
        [self addChildViewController:_upVC];
    }
    return _upVC;
}

- (SSGoodManngerContentVC *)downVC{
    if(!_downVC){
        _downVC = [[SSGoodManngerContentVC alloc]initWithType:2];
        _downVC.view.frame = CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-kSSGoodManngerContentVCBootomHeigt);
        kMeWEAKSELF
        _downVC.finishBlock = ^(SSNetListModel *responseObject) {
            kMeSTRONGSELF
            NSString *putaway = [NSString stringWithFormat:@"已上架(%@)",kMeUnNilStr(responseObject.putaway)];
            NSString *soldout = [NSString stringWithFormat:@"已下架(%@)",kMeUnNilStr(responseObject.soldout)];
            strongSelf.categoryView.titles = @[putaway,soldout];
            [strongSelf.categoryView reloadData];
        };
        _downVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addChildViewController:_downVC];
    }
    return _downVC;
}


@end
