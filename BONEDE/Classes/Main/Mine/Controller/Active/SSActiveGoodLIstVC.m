//
//  SSActiveGoodLIstVC.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSActiveGoodLIstVC.h"
#import "SSActiveGoodLIstCell.h"
#import "SSActiveGoodLIstModel.h"

@interface SSActiveGoodLIstVC ()<UITableViewDelegate, UITableViewDataSource,RefreshToolDelegate>{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;

@end

@implementation SSActiveGoodLIstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品选择";
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
}

- (NSDictionary *)requestParameter{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"token"] = kMeUnNilStr(kCurrentUser.token);
    if(_isSignIN){
        //签到
        dic[@"type"] = @"14";
    }
    return dic;
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSActiveGoodLIstModel mj_objectArrayWithKeyValuesArray:data]];
}

#pragma mark ------------------ <UITableViewDelegate, UITableViewDataSource> ----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSActiveGoodLIstCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSActiveGoodLIstCell class]) forIndexPath:indexPath];
    SSActiveGoodLIstModel *model = self.refresh.arrData[indexPath.row];
    [cell setUiwithModle:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSActiveGoodLIstCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSActiveGoodLIstModel *model = self.refresh.arrData[indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
    kMeCallBlock(_selectBlock,kMeUnNilStr(model.product_id));
}


#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSActiveGoodLIstCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSActiveGoodLIstCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];;
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        if(_isSignIN){
            _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(SSIPcommongetPrizeProduct)];
        }else{
            _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(SSIPcommongetBarginProduct)];
        }
        _refresh.isDataInside = YES;
        _refresh.delegate = self;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
            failView.lblOfNodata.text = @"没有活动商品,请先添加";
        }];
    }
    return _refresh;
}

@end
