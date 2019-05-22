//
//  SSMineSignInVC.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSMineSignInVC.h"
#import "SSMineSignInCell.h"
#import "SSMineSignInParModel.h"

@interface SSMineSignInVC ()<UITableViewDelegate, UITableViewDataSource>{
    NSString *_activeId;

}

@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, strong) SSMineSignInParModel *parModel;

@end

@implementation SSMineSignInVC

- (instancetype)initWithActiveId:(NSString *)activeId{
    if(self = [super init]){
        _activeId = activeId;
        _isEdit = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _isEdit?@"修改签到活动":@"添加签到活动";
    if(_isEdit){
        kMeWEAKSELF
        [SSPublicNetWorkTool postgetgetPrizeWithId:_activeId SuccessBlock:^(ZLRequestResponse *responseObject) {
            kMeSTRONGSELF
            strongSelf.parModel = [SSMineSignInParModel mj_objectWithKeyValues:responseObject.data];
            strongSelf.parModel.token = kMeUnNilStr(kCurrentUser.token);
            [strongSelf initSomeThing];
        } failure:^(id object) {
            kMeSTRONGSELF
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        self.parModel = [SSMineSignInParModel new];
        self.parModel.token = kMeUnNilStr(kCurrentUser.token);
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
    if(!kMeUnNilStr(self.parModel.title).length){
        [SSShowViewTool showMessage:@"活动标题不能为空" view:kMeCurrentWindow];
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
    
//    if(![SSCommonTool compareOneDay:self.parModel.end_time withAnotherDay:self.parModel.start_time]){
//        [SSShowViewTool showMessage:@"活动开始时间不能大于结束时间" view:kMeCurrentWindow];
//        return;
//    }
    
    if(!kMeUnNilStr(self.parModel.total).length){
        [SSShowViewTool showMessage:@"奖励份数不能为空" view:kMeCurrentWindow];
        return;
    }
    
    if([kMeUnNilStr(self.parModel.total) isEqualToString:@"0"]){
        [SSShowViewTool showMessage:@"奖励份数不能为空" view:kMeCurrentWindow];
        return;
    }
    //签到商品
    if(!kMeUnNilStr(self.parModel.product_id).length){
        [SSShowViewTool showMessage:@"绑定购买商品不能为空" view:kMeCurrentWindow];
        return;
    }
    
    kMeWEAKSELF
    [SSPublicNetWorkTool postgeteditOrAddPrizeWithmodel:self.parModel SuccessBlock:^(ZLRequestResponse *responseObject) {
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
    SSMineSignInCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSMineSignInCell class]) forIndexPath:indexPath];
    [cell setUiWithModel:_parModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSSMineSignInCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Set And Get

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kSSActiveBootomHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSMineSignInCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSMineSignInCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];;
    }
    return _tableView;
}

@end


