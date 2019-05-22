//
//  SSHomeClerkClerkListVC.m
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeClerkClerkListVC.h"
#import "SSClerkClerkListCell.h"
#import "SSClerkModel.h"
#import "SSForuClerkAnalysisVC.h"

@interface SSHomeClerkClerkListVC ()<UITableViewDelegate, UITableViewDataSource,RefreshToolDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;

@end

@implementation SSHomeClerkClerkListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"店员列表";
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
}

- (NSDictionary *)requestParameter{
    return @{@"token":kMeUnNilStr(kCurrentUser.token)};
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSClerkModel mj_objectArrayWithKeyValuesArray:data]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSClerkClerkListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSClerkClerkListCell class]) forIndexPath:indexPath];
    SSClerkModel *model = self.refresh.arrData[indexPath.row];
    [cell setUIWIthModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSClerkClerkListCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSClerkModel *model = self.refresh.arrData[indexPath.row];
    SSForuClerkAnalysisVC *vc = [[SSForuClerkAnalysisVC alloc]initWithUid:kMeUnNilStr(model.member_id)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSClerkClerkListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSClerkClerkListCell class])];
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
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(SSIPcommonMyClerk)];
        _refresh.delegate = self;
        _refresh.isGet = YES;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有店员";
        }];
    }
    return _refresh;
}

@end
