//
//  SSHomeAddTestDecVC.m
//  BONEDE
//
//  Created by hank on 2019/5/20.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSHomeAddTestDecVC.h"
#import "SSHomeAddTestDecCell.h"
#import "TDWebViewCell.h"
#import "SSHomeAddTestDecModel.h"
#import <TZImagePickerController.h>
#import "SSHomeAddTestSubjectVC.h"

const static CGFloat kMEHomeAddRedeemcodeVCBootomHeight = 67;
@interface SSHomeAddTestDecVC ()<UITableViewDelegate, UITableViewDataSource,TZImagePickerControllerDelegate>{
    NSString *_token;
}

@property (strong, nonatomic) TDWebViewCell                  *explainWebCell;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SSHomeAddTestDecModel *model;
@end

@implementation SSHomeAddTestDecVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试描述";
    kMeWEAKSELF
    if(_type == SSHomeAddTestDecTypelplatVC){
        _token = @"";
        [self initSomething];
    }else{
        [SSPublicNetWorkTool postgetForEvenQiuNiuTokkenWithSuccessBlock:^(ZLRequestResponse *responseObject) {
            kMeSTRONGSELF
            strongSelf->_token = responseObject.data[@"token"];
            [strongSelf initSomething];
        } failure:^(id object) {
            kMeSTRONGSELF
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }];
    }

    // Do any additional setup after loading the view.
}

- (void)initSomething{
    if(_type == SSHomeAddTestDecTypeeditVC || _type==SSHomeAddTestDecTypelplatVC){
        kMeWEAKSELF
        [SSPublicNetWorkTool postgetbanktestBankWithId:kMeUnNilStr(_bank_id) SuccessBlock:^(ZLRequestResponse *responseObject) {
            kMeSTRONGSELF
            strongSelf->_model = [SSHomeAddTestDecModel mj_objectWithKeyValues:responseObject.data];
            [strongSelf addSubView];
        } failure:^(id object) {
            kMeSTRONGSELF
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        _model = [SSHomeAddTestDecModel new];
        [self addSubView];
    }
}

- (void)addSubView{
    [self.view addSubview:self.tableView];
    UIView *viewForBottom = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-kMEHomeAddRedeemcodeVCBootomHeight, SCREEN_WIDTH, kMEHomeAddRedeemcodeVCBootomHeight)];
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(16, 10, SCREEN_WIDTH-32, 47);
    _btnAdd.backgroundColor = kSSPink;
    [_btnAdd setTitle:@"确定" forState:UIControlStateNormal];
    _btnAdd.cornerRadius =2;
    _btnAdd.clipsToBounds = YES;
    [_btnAdd addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewForBottom addSubview:_btnAdd];
    [self.view addSubview:viewForBottom];
    kMeWEAKSELF
    [SSPublicNetWorkTool postgetbanktestBankruleWithSuccessBlock:^(ZLRequestResponse *responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            kMeSTRONGSELF
            NSString *str = responseObject.data;
            CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
            NSString *header = [NSString stringWithFormat:@"<head><style>img{max-width:%fpx !important;}</style></head>",width];
            [strongSelf.explainWebCell.webView loadHTMLString:[NSString stringWithFormat:@"%@%@",header,kMeUnNilStr(str)] baseURL:nil];
            kTDWebViewCellDidFinishLoadNotification
        });
    } failure:^(id object) {
        
    }];
}

-(void)reloadWebViewHeight{
    [self.tableView reloadData];
}

- (void)addAction:(UIButton *)btn{
    if(_type == SSHomeAddTestDecTypeeditVC || _type==SSHomeAddTestDecTypelplatVC){
        SSHomeAddTestSubjectVC *vc = [[SSHomeAddTestSubjectVC alloc]initWithModel:_model];
        vc.type = _type;
        vc.token = _token;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if(!kMeUnNilStr(_model.title).length){
            [SSShowViewTool showMessage:@"请先输入测试标题" view:self.view];
            return;
        }
        if(!kMeUnNilStr(_model.desc).length){
            [SSShowViewTool showMessage:@"请输入内容描述" view:self.view];
            return;
        }
        if(!kMeUnNilStr(_model.image).length){
            [SSShowViewTool showMessage:@"请上传封面图" view:self.view];
            return;
        }
        SSCustomActionSheet *sheet = [[SSCustomActionSheet alloc]initWithTitles:@[@"图片题库",@"文字题库"]];
        kMeWEAKSELF
        sheet.blockBtnTapHandle = ^(NSInteger index){
            kMeSTRONGSELF
            if(!index){
                SSHomeAddTestSubjectVC *vc = [[SSHomeAddTestSubjectVC alloc]initWithModel:strongSelf->_model];
                vc.type = strongSelf->_type;
                vc.token = strongSelf->_token;
                strongSelf->_model.type = 1;
                [strongSelf->_model.questions removeAllObjects];
                SSHomeAddTestDecContentModel *imagMolde = [SSHomeAddTestDecContentModel new];
                imagMolde.type = 1;
                [strongSelf->_model.questions addObject:imagMolde];
                [strongSelf.navigationController pushViewController:vc animated:YES];
            }else{
                SSHomeAddTestSubjectVC *vc = [[SSHomeAddTestSubjectVC alloc]initWithModel:strongSelf->_model];
                vc.type = strongSelf->_type;
                vc.token = strongSelf->_token;
                strongSelf->_model.type = 2;
                [strongSelf->_model.questions removeAllObjects];
                SSHomeAddTestDecContentModel *titleMolde = [SSHomeAddTestDecContentModel new];
                titleMolde.type = 2;
                [strongSelf->_model.questions addObject:titleMolde];
                [strongSelf.navigationController pushViewController:vc animated:YES];
            }
        };
        [sheet show];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        SSHomeAddTestDecCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSHomeAddTestDecCell class]) forIndexPath:indexPath];
        [cell setUIWIthModel:_model];
        kMeWEAKSELF
        cell.addPhotoBlcok = ^{
            kMeSTRONGSELF
            [strongSelf addPhoto];
        };
        if(_type == SSHomeAddTestDecTypelplatVC){
            cell.userInteractionEnabled = NO;
        }
        return cell;
    }else{
        return self.explainWebCell;
    }
}

- (void)addPhoto{
    kMeWEAKSELF
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePicker.allowPickingOriginalPhoto = NO;
    imagePicker.allowPickingVideo = NO;
    [imagePicker setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto, NSArray<NSDictionary *> *infos) {
        kMeSTRONGSELF
        for (int i = 0; i < assets.count; i ++) {
            PHAsset *phAsset = assets[i];
            if (phAsset.mediaType == PHAssetMediaTypeImage) {
                UIImage *image = photos[i];
                NSString *filename = [phAsset valueForKey:@"filename"];
                NSString *path = [SSCommonTool getImagePath:image filename:filename];
                MBProgressHUD *HUD = [SSPublicNetWorkTool commitWithHUD:@""];
                [SSPublicNetWorkTool postQiNiuUpFileWithToken:strongSelf->_token filePath:path successBlock:^(id object) {
                    NSLog(@"%@",object);
                    if([object isKindOfClass:[NSDictionary class]]){
                        NSString *key = kMeUnNilStr(object[@"key"]);
                        strongSelf->_model.image = key;
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        kMeSTRONGSELF
                        [strongSelf.tableView reloadData];
                    });
                    [HUD hideAnimated:YES];
                } failure:^(id object) {
                    [SSShowViewTool SHOWHUDWITHHUD:HUD test:@"图片上传失败"];
                }];
            }
        }
    }];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        return kSSHomeAddTestDecCellHeight;
    }else{
        if(!_explainWebCell){
            return 0;
        }else{
            return [[self.explainWebCell.webView stringByEvaluatingJavaScriptFromString: @"document.body.scrollHeight"] intValue];
        }
    }
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kMEHomeAddRedeemcodeVCBootomHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TDWebViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TDWebViewCell class])];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSHomeAddTestDecCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSHomeAddTestDecCell class])];
        
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

- (TDWebViewCell *)explainWebCell{
    if(!_explainWebCell){
        _explainWebCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TDWebViewCell class])];
    }
    return _explainWebCell;
}

@end
