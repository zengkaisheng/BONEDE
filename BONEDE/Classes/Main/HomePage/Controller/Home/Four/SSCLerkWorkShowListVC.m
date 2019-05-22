//
//  SSCLerkWorkShowListVC.m
//  BONEDE
//
//  Created by hank on 2019/5/17.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSCLerkWorkShowListVC.h"
#import "SSCLerkWorkShowListCell.h"
#import "SSCLerkWorkShowListModel.h"

@interface SSCLerkWorkShowListVC ()<UITableViewDelegate,UITableViewDataSource,RefreshToolDelegate>
{
    SSCLerkWorkShowListType _type;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;
@end

@implementation SSCLerkWorkShowListVC

- (instancetype)initWithType:(SSCLerkWorkShowListType)type{
    if(self = [super init]){
        _type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_type == SSCLerkWorkShowListShareType){
        self.title = @"分享数";
    }else if (_type == SSCLerkWorkShowListChatType){
        self.title = @"沟通数";
    }else if (_type == SSCLerkWorkShowListCustomerType){
        self.title = @"客户数";
    }else if (_type == SSCLerkWorkShowListTaskType){
        self.title = @"任务数";
    }
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
}

#pragma mark - RefreshToolDelegate

- (NSDictionary *)requestParameter{
    return @{@"token":kMeUnNilStr(kCurrentUser.token)};
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSCLerkWorkShowListModel mj_objectArrayWithKeyValuesArray:data]];
}


#pragma mark - tableView deleagte and sourcedata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSCLerkWorkShowListModel *model = self.refresh.arrData[indexPath.row];
    SSCLerkWorkShowListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSCLerkWorkShowListCell class]) forIndexPath:indexPath];
    [cell setUiWithType:_type model:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSSCLerkWorkShowListCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SSArticelModel *model = self.refresh.arrData[indexPath.row];
//    SSArticleDetailVC *detailVC  = [[SSArticleDetailVC alloc]initWithModel:model];
//    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma MARK - Setter

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSCLerkWorkShowListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSCLerkWorkShowListCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        NSString *str = @"";
        if(_type == SSCLerkWorkShowListShareType){
            str = SSIPcommongetStoreThisMonthShareDetail;
        }else if (_type == SSCLerkWorkShowListChatType){
            str = SSIPcommongetStoreThisMonthFollowUpDetail;
        }else if (_type == SSCLerkWorkShowListCustomerType){
            str = SSIPcommongetStoreThisMonthFollowUpMemberDetail;
        }else if (_type == SSCLerkWorkShowListTaskType){
            str = SSIPcommongetStoreThisMonthFinishTaskDetail;
        }
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(str)];
        _refresh.delegate = self;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有数据";
        }];
    }
    return _refresh;
}

@end
