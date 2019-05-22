//
//  SSShoppingMallContentVC.m
//  BONEDE
//
//  Created by hank on 2018/12/18.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSShoppingMallContentVC.h"
#import "SSFilterMainModel.h"
//#import "SSProductDetailsVC.h"
#import "SSThridProductDetailsVC.h"
#import "SSGoodModel.h"
#import "SSAdModel.h"
#import "SSHomePageSaveModel.h"
#import "SSShoppingMallCell.h"

@interface SSShoppingMallContentVC ()<UITableViewDelegate, UITableViewDataSource,RefreshToolDelegate,SDCycleScrollViewDelegate>{
    SSFilterMainModel *_model;
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZLRefreshTool         *refresh;
@property(nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong) UIView *sdView;
@property (nonatomic,strong) NSArray *arrAdModel;
@end

@implementation SSShoppingMallContentVC

- (instancetype)initWithModel:(SSFilterMainModel *)model{
    if(self = [super init]){
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBarHidden = YES;
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
}

- (void)requestSD{
    kMeWEAKSELF
    [SSPublicNetWorkTool postAdWithSuccessBlock:^(ZLRequestResponse *responseObject) {
        kMeSTRONGSELF
        if([responseObject.data isKindOfClass:[NSDictionary class]]){
            NSArray *banner_headArr = responseObject.data[@"banner_head"];
            NSArray *arr = [SSAdModel mj_objectArrayWithKeyValuesArray:banner_headArr];
            [SSHomePageSaveModel saveAdsModel:arr];
            strongSelf.arrAdModel = arr;
            [strongSelf setAdUI];
        }else{
            strongSelf.arrAdModel = [SSHomePageSaveModel getAdsModel];
            [strongSelf setAdUI];
        }
    } failure:^(id object) {
        kMeSTRONGSELF
        strongSelf.arrAdModel = [SSHomePageSaveModel getAdsModel];
        [strongSelf setAdUI];
    }];
}


- (void)setAdUI{
    __block NSMutableArray *arrImage = [NSMutableArray array];
    [_arrAdModel enumerateObjectsUsingBlock:^(SSAdModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrImage addObject:kMeUnNilStr(model.ad_img)];
    }];
    self.cycleScrollView.imageURLStringsGroup = arrImage;
    self.tableView.tableHeaderView = self.sdView;
    [self.tableView reloadData];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    SSAdModel *model = kMeUnArr(_arrAdModel)[index];
    SSThridProductDetailsVC *dvc = [[SSThridProductDetailsVC alloc]initWithId:model.product_id];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (NSDictionary *)requestParameter{
    if(_model.idField == 0 && self.refresh.pageIndex == 1){
        [self requestSD];
    }
    return @{@"category_id":@(_model.idField),
             @"uid":kMeUnNilStr(kCurrentUser.uid)
             };
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSGoodModel mj_objectArrayWithKeyValuesArray:data]];
}

#pragma mark ------------------ <UITableViewDelegate, UITableViewDataSource> ----

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSGoodModel *model = self.refresh.arrData[indexPath.row];
    SSShoppingMallCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSShoppingMallCell class]) forIndexPath:indexPath];
    [cell setUIWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSShoppingMallCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSGoodModel *model = self.refresh.arrData[indexPath.row];
    SSThridProductDetailsVC *dvc = [[SSThridProductDetailsVC alloc]initWithId:model.product_id];
    [self.navigationController pushViewController:dvc animated:YES];
}


#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeStatusBarHeight-kCategoryViewHeight-kSerachHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSShoppingMallCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSShoppingMallCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(SSIPcommonFindGoods)];
        _refresh.delegate = self;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有产品";
        }];
    }
    return _refresh;
}

- (SDCycleScrollView *)cycleScrollView{
    if(!_cycleScrollView){
        CGFloat w = SCREEN_WIDTH - 20;
        CGFloat h = (w * 300)/710;
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 10, w, h) imageURLStringsGroup:nil];
        _cycleScrollView.contentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.clipsToBounds = YES;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.pageControlStyle =SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.autoScrollTimeInterval = 4;
        _cycleScrollView.delegate =self;
        _cycleScrollView.backgroundColor = [UIColor clearColor];
        _cycleScrollView.placeholderImage = kImgBannerPlaceholder;
        _cycleScrollView.currentPageDotColor = kSSPink;
        _cycleScrollView.contentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.cornerRadius = 8;
        _cycleScrollView.clipsToBounds = YES;
    }
    return _cycleScrollView;
}

- (UIView *)sdView{
    if(!_sdView){
        CGFloat w = SCREEN_WIDTH - 20;
        CGFloat h = (w * 300)/710;
        _sdView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, h+24+10)];
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, h+24, SCREEN_WIDTH, 10)];
        lineView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
        [_sdView addSubview:self.cycleScrollView];
        [_sdView addSubview:lineView];
    }
    return _sdView;
}



@end
