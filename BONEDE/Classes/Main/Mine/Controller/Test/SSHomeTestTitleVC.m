//
//  SSHomeTestTitleVC.m
//  BONEDE
//
//  Created by hank on 2019/5/21.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeTestTitleVC.h"
#import "SSHomeTestTitleModel.h"
#import "SSHomeTestTitleCell.h"
#import "SSHomeAddTestDecVC.h"

@interface SSHomeTestTitleVC ()<UITableViewDelegate,UITableViewDataSource,RefreshToolDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;
@end

@implementation SSHomeTestTitleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _isplatform?@"平台测试题库":@"历史测试题库";
    self.view.backgroundColor = kSSf6f6f6;
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
    [self.refresh.arrData addObjectsFromArray:[SSHomeTestTitleModel mj_objectArrayWithKeyValuesArray:data]];
}

#pragma mark - tableView deleagte and sourcedata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSHomeTestTitleModel *model = self.refresh.arrData[indexPath.row];
    SSHomeTestTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSHomeTestTitleCell class]) forIndexPath:indexPath];
    [cell setUIWithModel:model];
    cell.btnDel.hidden = _isplatform;
    kMeWEAKSELF
    cell.delBlock = ^{
        SSAlertView *aler = [[SSAlertView alloc] initWithTitle:@"" message:@"确定删除吗?"];
        [aler addButtonWithTitle:@"确定" block:^{
            [SSPublicNetWorkTool postgetbankdelBankWithId:kMeUnNilStr(model.idField) SuccessBlock:^(ZLRequestResponse *responseObject) {
                kMeSTRONGSELF
                [strongSelf.refresh reload];
            } failure:nil];
        }];
        [aler addButtonWithTitle:@"取消"];
        [aler show];
    };
    cell.shareBlock = ^{
        kMeSTRONGSELF
        [strongSelf toShareWithModel:model];
    };
    return cell;
}

- (void)toShareWithModel:(SSHomeTestTitleModel *)model{
    SSShareTool *shareTool = [SSShareTool me_instanceForTarget:self];
    
#ifdef TestVersion
    NSString *shareIP = [NSString stringWithFormat:@"https://test.bondehome.com/wechat/dist/newAuth.html?entrance=start&bank_id=%@&uid=%@",kMeUnNilStr(model.idField),kMeUnNilStr(kCurrentUser.uid)];
#else
      NSString *shareIP = [NSString stringWithFormat:@"https://api.bondehome.com/wechat/dist/newAuth.html?entrance=start&bank_id=%@&uid=%@",kMeUnNilStr(model.idField),kMeUnNilStr(kCurrentUser.uid)];
#endif

    shareTool.sharWebpageUrl = shareIP;
    //    [NSString stringWithFormat:@"%@%@",SSIPArticelShare,@(_detailModel.article_id).description];
    shareTool.shareTitle = kMeUnNilStr(model.title);
    shareTool.shareDescriptionBody = kMeUnNilStr(model.desc);
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString* key = [manager cacheKeyForURL:[NSURL URLWithString:kMeUnNilStr(model.image_url)]];
    SDImageCache* cache = [SDImageCache sharedImageCache];
    shareTool.shareImage = [cache imageFromDiskCacheForKey:key];
    [shareTool showShareView:kShareWebPageContentType success:^(id data) {
        NSLog(@"分享成功%@",data);
    } failure:^(NSError *error) {
        NSLog(@"分享失败");
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSHomeTestTitleModel *model = self.refresh.arrData[indexPath.row];
    return [SSHomeTestTitleCell getCellheightWithMolde:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSHomeTestTitleModel *model = self.refresh.arrData[indexPath.row];
    if(_isplatform){
        SSHomeAddTestDecVC *vc = [[SSHomeAddTestDecVC alloc]init];
        vc.type = SSHomeAddTestDecTypelplatVC;
        vc.bank_id = kMeUnNilStr(model.idField);
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        SSHomeAddTestDecVC *vc = [[SSHomeAddTestDecVC alloc]init];
        vc.type = SSHomeAddTestDecTypeeditVC;
        vc.bank_id = kMeUnNilStr(model.idField);
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma MARK - Setter

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSHomeTestTitleCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSHomeTestTitleCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = kSSf6f6f6;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        NSString *str = _isplatform?SSIPcommonbankplatformTest:SSIPcommonbankhistoryTest;
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.tableView url:kGetApiWithUrl(str)];
        _refresh.delegate = self;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有测试题";
        }];
    }
    return _refresh;
}


@end
