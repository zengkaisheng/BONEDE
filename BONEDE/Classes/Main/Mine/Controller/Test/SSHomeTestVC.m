//
//  SSHomeTestVC.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeTestVC.h"
#import "SSHomeTestCell.h"
#import "SSHomeAddTestDecVC.h"
#import "SSHomeTestTitleVC.h"

@interface SSHomeTestVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SSHomeTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试题库";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f6f5fa"];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSHomeTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSHomeTestCell class]) forIndexPath:indexPath];
    [cell setUIWIithType:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case SSHomeTestCellCotentType:
        {
            SSHomeAddTestDecVC *vc = [[SSHomeAddTestDecVC alloc]init];
            vc.type = SSHomeAddTestDecTypeaddVC;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case SSHomeTestListCell:
        {
            SSHomeTestTitleVC*vc = [[SSHomeTestTitleVC alloc]init];
            //平台测试库
            vc.isplatform = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
            break;
        case SSHomeTestHistoryCell:
        {
            //历史
            SSHomeTestTitleVC*vc = [[SSHomeTestTitleVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    
            break;
        default:
            break;
    }
}


#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSHomeTestCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSHomeTestCell class])];
        _tableView.rowHeight = kSSHomeTestCellHeight;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f6f5fa"];
    }
    return _tableView;
}



@end
