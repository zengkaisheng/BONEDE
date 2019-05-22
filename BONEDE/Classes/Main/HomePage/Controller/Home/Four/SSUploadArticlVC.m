//
//  SSUploadArticlVC.m
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSUploadArticlVC.h"
#import "SSUploadArticelCell.h"
#import "SSArticleDetailVC.h"
#import "SSArticelModel.h"
#import "SSUploadArticlDetailVC.h"

@interface SSUploadArticlVC ()<UITableViewDelegate,UITableViewDataSource,RefreshToolDelegate>{
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;
@property (nonatomic, strong) UIButton *btnSave;


@end

@implementation SSUploadArticlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文章上传";
    [self.view addSubview:self.tableView];
    [self.view addSubview:[self getBottomView]];
    [self.refresh addRefreshView];
}

#pragma mark - RefreshToolDelegate

- (NSDictionary *)requestParameter{
    return @{};
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    [self.refresh.arrData addObjectsFromArray:[SSArticelModel mj_objectArrayWithKeyValuesArray:data]];
}


- (void)uploadAction:(UIButton *)btn{
    SSUploadArticlDetailVC *vc = [[SSUploadArticlDetailVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - tableView deleagte and sourcedata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSArticelModel *model = self.refresh.arrData[indexPath.row];
    SSUploadArticelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSUploadArticelCell class]) forIndexPath:indexPath];
    [cell setUIWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSSUploadArticelCellheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSArticelModel *model = self.refresh.arrData[indexPath.row];
    SSArticleDetailVC *detailVC  = [[SSArticleDetailVC alloc]initWithModel:model];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma MARK - Setter

- (UIView *)getBottomView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 90, SCREEN_WIDTH, 90)];
    _btnSave = [SSView btnWithFrame:CGRectMake(15, (90-40)/2, SCREEN_WIDTH-30, 40) Img:nil title:@"上传文章" target:self Action:@selector(uploadAction:)];
    _btnSave.cornerRadius = 20;
    _btnSave.clipsToBounds = YES;
    _btnSave.backgroundColor = kSSPink;
    [_btnSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnSave.titleLabel.font = kMeFont(15);
    [view addSubview:_btnSave];
    return view;
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-90) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSUploadArticelCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSUploadArticelCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        view.backgroundColor = [UIColor colorWithHexString:@"f1f2f6"];
        _tableView.tableFooterView = view;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f1f2f6"];
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(SSIPcommonGetArticle)];
        _refresh.delegate = self;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有文章";
        }];
    }
    return _refresh;
}



@end
