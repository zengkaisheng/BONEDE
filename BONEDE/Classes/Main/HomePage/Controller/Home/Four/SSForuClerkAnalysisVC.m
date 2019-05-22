//
//  SSForuClerkAnalysisVC.m
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSForuClerkAnalysisVC.h"
#import "SSPolarChartMixedCell.h"
#import "SSBrandAbilityAnalysisModel.h"
#import "SSForuClerkAnalysisModel.h"

@interface SSForuClerkAnalysisVC ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_arrData;
    NSString *_uid;
    SSForuClerkAnalysisModel *_mode;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SSForuClerkAnalysisVC

- (instancetype)initWithUid:(NSString *)uid{
    if(self = [super init]){
        _uid = uid;
        _mode = [SSForuClerkAnalysisModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"员工分析";
    _arrData = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headrefresh)];
    [self.tableView.mj_header beginRefreshing];
}
- (void)headrefresh{
    kMeWEAKSELF
    [SSPublicNetWorkTool postgetSSIPcommonclerkAnalyzeWithUid:_uid SuccessBlock:^(ZLRequestResponse *responseObject) {
        kMeSTRONGSELF
        strongSelf->_mode = [SSForuClerkAnalysisModel mj_objectWithKeyValues:responseObject.data];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    } failure:^(id object) {
        kMeSTRONGSELF
        strongSelf->_mode = [SSForuClerkAnalysisModel new];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    }];
}

#pragma mark ------------------ <UITableViewDelegate, UITableViewDataSource> ----

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSPolarChartMixedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSPolarChartMixedCell class]) forIndexPath:indexPath];
    [cell setAnalysisUiWithModel:_mode];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSPolarChartMixedCellHeight;
}

#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSPolarChartMixedCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSPolarChartMixedCell class])];
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
