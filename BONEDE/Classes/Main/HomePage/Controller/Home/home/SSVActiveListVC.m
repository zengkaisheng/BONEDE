//
//  SSVActiveListVC.m
//  BONEDE
//
//  Created by hank on 2018/10/25.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSVActiveListVC.h"
#import "SSActiveCell.h"

@interface SSVActiveListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imgHeader;
@property (strong , nonatomic) ZLRefreshTool *refresh;

@end

@implementation SSVActiveListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"双十一活动专区";
    self.tableView.tableHeaderView = self.imgHeader;
    [self.view addSubview:self.tableView];
    [self.refresh addRefreshView];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSActiveCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSActiveCell class])];
    kSDLoadImg(cell.imgPic, @"");
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSSActiveCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UIImageView *)imgHeader{
    if(!_imgHeader){
        CGFloat height = (180 * kMeFrameScaleY());
        _imgHeader = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
        kSDLoadImg(_imgHeader, @"");
    }
    return _imgHeader;
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSActiveCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSActiveCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
@end
