//
//  SSMyPosterContentListVC.m
//  BONEDE
//
//  Created by hank on 2018/11/27.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSMyPosterContentListVC.h"
#import "SSMyPosterContentCell.h"
#import "SSPosterModel.h"
#import "SSCreatePosterVC.h"
#import "SSPosterActiveVC.h"
#import "SSActivePosterModel.h"

@interface SSMyPosterContentListVC ()<UICollectionViewDelegate,UICollectionViewDataSource,RefreshToolDelegate>{
    CGFloat _cellHeight;
    BOOL _isActive;
    BOOL _isPost;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;
@property (nonatomic, strong) UIView         *headerView;
@end

@implementation SSMyPosterContentListVC

- (instancetype)initWithActice{
    if(self = [super init]){
        _isActive = YES;
    }
    return self;
}

- (instancetype)initWithPost{
    if(self = [super init]){
        _isPost = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellHeight = [SSMyPosterContentCell getCellHeight];
    [self.view addSubview:self.collectionView];
    [self.refresh addRefreshView];
}

- (void)reloadData {
    [self.refresh reload];
}

- (NSDictionary *)requestParameter{
    if(_isActive){
        return @{@"token":kMeUnNilStr(kCurrentUser.token)};
    }else if (_isPost) {
        return @{@"token":kMeUnNilStr(kCurrentUser.token),
                 @"store_id":kMeUnNilStr(kCurrentUser.store_id)
                 };
    }
    return @{@"token":kMeUnNilStr(kCurrentUser.token)};
}

- (void)handleResponse:(id)data{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    if(_isActive){
        [self.refresh.arrData addObjectsFromArray:[SSActivePosterModel mj_objectArrayWithKeyValuesArray:data]];
    }else{
        [self.refresh.arrData addObjectsFromArray:[SSPosterChildrenModel mj_objectArrayWithKeyValuesArray:data]];
    }
}

#pragma mark- CollectionView Delegate And DataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_isActive){
        SSActivePosterModel *model = self.refresh.arrData[indexPath.row];
        SSPosterActiveVC *vc = [[SSPosterActiveVC alloc]initWithModel:model];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        SSPosterChildrenModel *model = self.refresh.arrData[indexPath.row];
        SSCreatePosterVC *vc = [[SSCreatePosterVC alloc]initWithModel:model];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SSMyPosterContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SSMyPosterContentCell class]) forIndexPath:indexPath];
    if(!_isActive){
         SSPosterChildrenModel *model = self.refresh.arrData[indexPath.row];
        kMeWEAKSELF
        cell.delBlock = ^{
            SSAlertView *aler = [[SSAlertView alloc] initWithTitle:@"" message:@"确定删除吗?"];
            [aler addButtonWithTitle:@"确定" block:^{
                kMeSTRONGSELF
                NSString *strId = @(model.idField).description;
                if (strongSelf->_isPost) {
                    [SSPublicNetWorkTool postDelMyPostersWithId:kMeUnNilStr(strId) SuccessBlock:^(ZLRequestResponse *responseObject) {
                        [strongSelf.refresh reload];
                    } failure:nil];
                }else {
                    [SSPublicNetWorkTool postDelSharePosterWithId:kMeUnNilStr(strId) SuccessBlock:^(ZLRequestResponse *responseObject) {
                        [strongSelf.refresh reload];
                    } failure:nil];
                }
            }];
            [aler addButtonWithTitle:@"取消"];
            [aler show];
            
        };
        [cell setiWithModel:model];
    }else{
        SSActivePosterModel *model = self.refresh.arrData[indexPath.row];
        [cell setiActiveWithModel:model];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kSSMyPosterContentCellWdith, _cellHeight);
}

//section的上下左右
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(34*kMeFrameScaleX(), k10Margin, 0, k10Margin);
}

//cell上下之间
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return k10Margin*5 *kMeFrameScaleX();
}

//cell左右之间
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return k10Margin-2;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){//处理头视图
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WMBannerView" forIndexPath:indexPath];
        [headerView addSubview:self.headerView];
        return headerView;
    }
    else{
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 64);
}

#pragma mark - Getting And Setting

- (UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kCategoryViewHeight-90)  collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SSMyPosterContentCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([SSMyPosterContentCell class])];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"WMBannerView"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;

    }
    return _collectionView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        NSString *str = SSIPcommonGetSharePoster;
        if(_isActive){
            str = SSIPadminGetActivePoster;
        }
        if (_isPost) {
            str = SSIPadminGetMyPosters;
        }
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.collectionView url:kGetApiWithUrl(str)];
        _refresh.delegate = self;
        _refresh.isDataInside = YES;
        kMeWEAKSELF
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            kMeSTRONGSELF
            failView.backgroundColor = [UIColor whiteColor];
            if(strongSelf->_isActive){
                failView.lblOfNodata.text = @"没有活动";
            }else if (strongSelf->_isPost) {
                failView.lblOfNodata.text = @"没有上传";
            }else {
               failView.lblOfNodata.text = @"没有分享";
            }
        }];
    }
    return _refresh;
}

- (UIView *)headerView{
    if(!_headerView){
        CGFloat vHeight = 64;
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, vHeight)];
        _headerView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(12, 10, SCREEN_WIDTH-24, vHeight-20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *lbls = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-24-20, vHeight-20)];
        lbls.font = [UIFont systemFontOfSize:12];
        lbls.textColor = [UIColor colorWithHexString:@"5b5b5b"];
        if(_isActive){
            lbls.text = @"这里是活动海报,每一份海报都带着一份惊喜";
        }else{
            lbls.text = @"这里有您生成过的所有问候海报,可以重复分享哦";
        }
        [view addSubview:lbls];
        [_headerView addSubview:view];
    }
    return _headerView;
}

@end
