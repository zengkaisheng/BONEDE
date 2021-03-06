//
//  SSAICustomerCheckDetailVC.m
//  BONEDE
//
//  Created by gao lei on 2019/5/29.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import "SSAICustomerCheckDetailVC.h"
#import "SSAICustomerCheckDetailModel.h"
#import "SSAICustomerCheckDetailCell.h"

@interface SSAICustomerCheckDetailVC ()<UITableViewDelegate,UITableViewDataSource,RefreshToolDelegate>
{
    NSString *_url;
    NSInteger _type;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool *refresh;

@end

@implementation SSAICustomerCheckDetailVC

- (instancetype)initWithUrl:(NSString *)url type:(NSInteger)type {
    if (self = [super init]) {
        _url = url;
        _type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor colorWithHexString:@"f4f4f4"];
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
    kOrderReload
}

- (NSDictionary *)requestParameter{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"token"] = kMeUnNilStr(kCurrentUser.token);
    dic[@"day_type"] = [NSString stringWithFormat:@"%ld",(long)_type];
    return dic;
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSAICustomerCheckDetailModel mj_objectArrayWithKeyValuesArray:data]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSAICustomerCheckDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSAICustomerCheckDetailCell class]) forIndexPath:indexPath];
    SSAICustomerCheckDetailModel *model = self.refresh.arrData[indexPath.row];
    [cell setUIWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSAICustomerCheckDetailCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    SSAIDataHomeTimeModel *model = self.refresh.arrData[indexPath.row];
    
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight + 9, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSAICustomerCheckDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSAICustomerCheckDetailCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor =[UIColor colorWithHexString:@"f4f4f4"];
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(_url)];
        _refresh.isDataInside = YES;
        _refresh.isGet = NO;
        _refresh.delegate = self;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有记录";
        }];
    }
    return _refresh;
}

@end
