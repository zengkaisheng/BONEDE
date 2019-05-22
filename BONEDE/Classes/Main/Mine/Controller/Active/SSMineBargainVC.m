//
//  SSMineBargainVC.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSMineBargainVC.h"
#import "SSMineBargainCell.h"
#import "SSMineAddBargainParModel.h"

@interface SSMineBargainVC ()<UITableViewDelegate, UITableViewDataSource>{
    NSString *_activeId;
}

@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SSMineAddBargainParModel *parModel;
@property (nonatomic, assign) BOOL isEdit;
@end

@implementation SSMineBargainVC

- (instancetype)initWithActiveId:(NSString *)activeId{
    if(self = [super init]){
        _activeId = activeId;
        _isEdit = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _isEdit?@"修改砍价活动":@"添加砍价活动";
    if(_isEdit){
        kMeWEAKSELF
        [SSPublicNetWorkTool postgetgetBarginWithId:_activeId SuccessBlock:^(ZLRequestResponse *responseObject) {
            kMeSTRONGSELF
            strongSelf.parModel = [SSMineAddBargainParModel mj_objectWithKeyValues:responseObject.data];
            self.parModel.token = kMeUnNilStr(kCurrentUser.token);
#warning ---默认启用
            //默认启用 状态：1启用2禁用
            self.parModel.status = 1;
            [strongSelf initSomeThing];
        } failure:^(id object) {
            kMeSTRONGSELF
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        self.parModel = [SSMineAddBargainParModel new];
        self.parModel.token = kMeUnNilStr(kCurrentUser.token);
#warning ---默认启用
        //默认启用 状态：1启用2禁用
        self.parModel.status = 1;
        [self initSomeThing];
    }
    // Do any additional setup after loading the view.
}

- (void)initSomeThing{
    [self.view addSubview:self.tableView];
    UIView *viewForBottom = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-kSSActiveBootomHeight, SCREEN_WIDTH, kSSActiveBootomHeight)];
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(16, 10, SCREEN_WIDTH-32, 47);
    _btnAdd.backgroundColor = kSSPink;
    [_btnAdd setTitle:@"保存" forState:UIControlStateNormal];
    _btnAdd.cornerRadius =2;
    _btnAdd.clipsToBounds = YES;
    [_btnAdd addTarget:self action:@selector(addGoodAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewForBottom addSubview:_btnAdd];
    [self.view addSubview:viewForBottom];
}

- (void)addGoodAction:(UIButton*)btn{
    if(!kMeUnNilStr(self.parModel.amount_money).length){
        [SSShowViewTool showMessage:@"可砍金额不能为空" view:kMeCurrentWindow];
        return;
    }
    if([kMeUnNilStr(self.parModel.amount_money) isEqualToString:@"0"]){
        [SSShowViewTool showMessage:@"可砍金额不能为0" view:kMeCurrentWindow];
        return;
    }
    
    if(!kMeUnNilStr(self.parModel.bargin_num).length){
        [SSShowViewTool showMessage:@"需要砍价次数不能为空" view:kMeCurrentWindow];
        return;
    }
    if([kMeUnNilStr(self.parModel.bargin_num) isEqualToString:@"0"]){
        [SSShowViewTool showMessage:@"需要砍价次数不能为0" view:kMeCurrentWindow];
        return;
    }
    
    if(!kMeUnNilStr(self.parModel.start_time).length){
        [SSShowViewTool showMessage:@"开始时间不能为空" view:kMeCurrentWindow];
        return;
    }
    
    if(!kMeUnNilStr(self.parModel.end_time).length){
        [SSShowViewTool showMessage:@"结束时间不能为空" view:kMeCurrentWindow];
        return;
    }

    
    if(!kMeUnNilStr(self.parModel.days).length){
        [SSShowViewTool showMessage:@"砍价限时不能为空" view:kMeCurrentWindow];
        return;
    }
    
    if(!kMeUnNilStr(self.parModel.product_id).length){
        [SSShowViewTool showMessage:@"绑定购买商品不能为空" view:kMeCurrentWindow];
        return;
    }
    
    kMeWEAKSELF
    [SSPublicNetWorkTool postgetupdateOrCreateBarginWithmodel:self.parModel SuccessBlock:^(ZLRequestResponse *responseObject) {
        kMeSTRONGSELF
        [strongSelf.navigationController popViewControllerAnimated:YES];
        kMeCallBlock(strongSelf->_finishBlock);
    } failure:^(id object) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSMineBargainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSMineBargainCell class]) forIndexPath:indexPath];
    [cell setUiWithModel:_parModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSMineBargainCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kSSActiveBootomHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSMineBargainCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSMineBargainCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];;
    }
    return _tableView;
}

@end
