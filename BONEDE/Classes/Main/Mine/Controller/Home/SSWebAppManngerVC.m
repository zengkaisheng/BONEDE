//
//  SSWebAppManngerVC.m
//  BONEDE
//
//  Created by hank on 2019/5/15.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSWebAppManngerVC.h"
#import "SSWebAppManngerCell.h"

@interface SSWebAppManngerVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SSWebAppManngerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小程序管理";
    self.view.backgroundColor = [UIColor colorWithHexString:@"F6F5FA"];
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView deleagte and sourcedata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSWebAppManngerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSWebAppManngerCell class]) forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSSWebAppManngerCellHeight;
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSWebAppManngerCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSWebAppManngerCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"F6F5FA"];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
