//
//  SSBrandAbilityAnalysisVC.m
//  BONEDE
//
//  Created by hank on 2019/3/12.
//  Copyright © 2019 hank. All rights reserved.
//

#import "SSBrandAbilityAnalysisVC.h"
#import "SSBrandAbilityManngerVC.h"
#import "SSPolarChartMixedCell.h"
#import "SSBrandAbilityAnalysisDataModel.h"
#import "SSBrandAbilityAnalysisCell.h"
#import "SSBrandAbilityAnalysisModel.h"
#import "SSBrandAISortModel.h"


@interface SSBrandAbilityAnalysisVC ()<UITableViewDelegate, UITableViewDataSource>{
    SSBrandAbilityAnalysisModel *_model;
    NSMutableArray *_arrData;
    SSBrandAISortModel *_sortModel;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SSBrandAbilityAnalysisVC

- (instancetype)initWithModel:(SSBrandAISortModel *)model{
    if(self = [super init]){
        _sortModel = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    _arrData = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headrefresh)];
    [self.tableView.mj_header beginRefreshing];
}

- (void)headrefresh{
    kMeWEAKSELF
    [SSPublicNetWorkTool postgetAbilityRankWithStoreId:_sortModel.store_id  SuccessBlock:^(ZLRequestResponse *responseObject) {
        kMeSTRONGSELF
        strongSelf->_model = [SSBrandAbilityAnalysisModel mj_objectWithKeyValues:responseObject.data];
        [strongSelf delaArrWithModel:strongSelf->_model];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    } failure:^(id object) {
        kMeSTRONGSELF
        strongSelf->_model = [SSBrandAbilityAnalysisModel new];
        [strongSelf->_arrData removeAllObjects];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    }];
}

- (void)delaArrWithModel:(SSBrandAbilityAnalysisModel *)mode;{
    [_arrData removeAllObjects];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"销售力综合排名" subtitle:@(mode.sale_comprehensive).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"获客能力排名" subtitle:@(mode.access_rank).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"销售能力排行" subtitle:@(mode.sale_rank).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"客户互动力排名" subtitle:@(mode.communicate_rank).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"产品推动力排名" subtitle:@(mode.product_rank).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"客户跟进力排行" subtitle:@(mode.sale_num_rank).description]];
    [_arrData addObject:[SSBrandAbilityAnalysisDataModel modelWithTitle:@"活动推动力排行" subtitle:@(mode.activity_rank).description]];
}

#pragma mark ------------------ <UITableViewDelegate, UITableViewDataSource> ----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else{
        return _arrData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        SSPolarChartMixedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSPolarChartMixedCell class]) forIndexPath:indexPath];
        [cell setUiWithModel:_model];
        return cell;
    }else{
        SSBrandAbilityAnalysisDataModel *model =_arrData[indexPath.row];
        SSBrandAbilityAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSBrandAbilityAnalysisCell class]) forIndexPath:indexPath];
        [cell setUIWithModel:model];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        return kSSPolarChartMixedCellHeight;
    }else{
        return kSSBrandAbilityAnalysisCellHeight;
    }
}

#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kSSBrandAbilityManngerVCHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSPolarChartMixedCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSPolarChartMixedCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSBrandAbilityAnalysisCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSBrandAbilityAnalysisCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    }
    return _tableView;
}

@end
