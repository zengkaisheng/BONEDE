//
//  SSFilterGoodVC.m
//  BONEDE
//
//  Created by hank on 2018/11/1.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSFilterGoodVC.h"
#import "SSProductCell.h"
//#import "SSProductDetailsVC.h"
#import "SSThridProductDetailsVC.h"
#import "SSGoodModel.h"
#import "SSFilterGoodView.h"
#import "SSRCConversationVC.h"


const static CGFloat kImgCuster = 50;

@interface SSFilterGoodVC ()<UICollectionViewDelegate,UICollectionViewDataSource,RefreshToolDelegate,FilterSelectViewDelegate>{
    NSString *_category_id;
    NSString *_other;
    NSString *_goods_price;
    NSString *_title;
    NSString *_customId;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SSFilterGoodView *filterView;
@property (nonatomic, strong) ZLRefreshTool         *refresh;
@property (nonatomic, strong) UIImageView *imgStore;

@end

@implementation SSFilterGoodVC

- (instancetype)initWithcategory_id:(NSString *)category_id title:(NSString *)title{
    if(self = [super init]){
        _category_id = category_id;
        _title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _title;
    _other = @"";
    _goods_price = @"";
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.imgStore];
    [self.view addSubview:self.filterView];
    [self.refresh addRefreshView];
    // Do any additional setup after loading the view.
}

#pragma mark - RefreshToolDelegate

- (NSDictionary *)requestParameter{
    return @{@"category_id":kMeUnNilStr(_category_id),
             @"other":kMeUnNilStr(_other),
             @"goods_price":kMeUnNilStr(_goods_price),
            @"uid":kMeUnNilStr(kCurrentUser.uid)
             };
}

- (void)handleResponse:(id)data{
//    _filterView.canSelect = YES;
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
//    [self.refresh.arrData addObjectsFromArray:[SSGoodModel mj_objectArrayWithKeyValuesArray:data]];
    NSArray *arr = [SSGoodModel mj_objectArrayWithKeyValuesArray:data];
    NSMutableArray *arrNeed = [SSGoodModel mj_objectArrayWithKeyValuesArray:data];
    for (NSInteger i=0; i<arr.count; i++) {
        SSGoodModel *model = arr[i];
        if(model.product_id == 74){
            [arrNeed removeObjectAtIndex:i];
            break;
        }
    }
    [self.refresh.arrData addObjectsFromArray:arrNeed];
}

- (void)failureResponse:(NSError *)error{
//    _filterView.canSelect = YES;
}

#pragma mark - FilterSelectViewDelegate

- (void)selectTopButton:(SSFilterGoodView *)selectView withIndex:(NSInteger)index withButtonType:(ButtonClickType )type{
//    selectView.canSelect = NO;
    switch (index) {
        case 0:{
            NSLog(@"全部");
            _goods_price = @"";
            _other = @"";
            [self.refresh reload];
        }
            break;
        case 1:{
            NSLog(@"推荐");
            _goods_price = @"";
            _other = @"is_recommend";
            [self.refresh reload];
        }
            break;
        case 2:{
            NSLog(@"新品");
            _goods_price = @"";
            _other = @"is_new";
            [self.refresh reload];
        }
            break;
        case 3:{
            _other = @"";
            switch (type) {
                case ButtonClickTypeNormal:{
                    _goods_price = @"";
                    NSLog(@"正常价格");
                }
                    break;
                case ButtonClickTypeUp:{
                    NSLog(@"上价格升序排列");
                    _goods_price = @"ASC";
                }
                    break;
                case ButtonClickTypeDown:{
                    NSLog(@"下价格降序排列");
                    _goods_price = @"DESC";
                }
                    break;
                default:
                    break;
            }
            [self.refresh reload];
        }
            break;
        default:
            break;
    }
}

- (void)toCusromer{
    if(kMeUnNilStr(_customId).length){
        if([kMeUnNilStr(_customId) isEqualToString:kCurrentUser.tls_data.tls_id]){
            [SSShowViewTool showMessage:@"暂不支持和自己聊天" view:self.view];
        }else{
            TConversationCellData *data = [[TConversationCellData alloc] init];
            data.convId = kMeUnNilStr(_customId);
            data.convType = TConv_Type_C2C;
            data.title = @"棒的客服";
            SSRCConversationVC *chat = [[SSRCConversationVC alloc] initWIthconversationData:data];
            chat.isHideRemindBtn = YES;
            [self.navigationController pushViewController:chat animated:YES];
        }
    }else{
        kMeWEAKSELF
        [SSPublicNetWorkTool postGetCustomIdWithsuccessBlock:^(ZLRequestResponse *responseObject) {
            kMeSTRONGSELF
            NSString *custom =kMeUnNilStr(responseObject.data);
            strongSelf->_customId = kMeUnNilStr(custom);
            if([kMeUnNilStr(strongSelf->_customId) isEqualToString:kCurrentUser.tls_data.tls_id]){
                [SSShowViewTool showMessage:@"暂不支持和自己聊天" view:strongSelf.view];
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    TConversationCellData *data = [[TConversationCellData alloc] init];
                    data.convId = kMeUnNilStr(strongSelf->_customId);
                    data.convType = TConv_Type_C2C;
                    data.title = @"棒的客服";
                    SSRCConversationVC *chat = [[SSRCConversationVC alloc] initWIthconversationData:data];
                    chat.isHideRemindBtn = YES;
                    [strongSelf.navigationController pushViewController:chat animated:YES];
                });
            }
        } failure:^(id object) {

        }];
    }
}

#pragma mark- CollectionView Delegate And DataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SSGoodModel *model = self.refresh.arrData [indexPath.row];
    SSThridProductDetailsVC *details = [[SSThridProductDetailsVC alloc]initWithId:model.product_id];
    [self.navigationController pushViewController:details animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.refresh.arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SSProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SSProductCell class]) forIndexPath:indexPath];
    SSGoodModel *model = self.refresh.arrData[indexPath.row];
    [cell setUIWithModel:model];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kSSProductCellWdith, kSSProductCellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(kSSMargin*2, kSSMargin*2, kSSMargin*2, kSSMargin*2);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return kSSMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return kSSMargin;
}

#pragma mark - Getting And Setting

- (UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kMeNavBarHeight+kSSFilterGoodViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight-kSSFilterGoodViewHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SSProductCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([SSProductCell class])];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;
        
    }
    return _collectionView;
}

- (ZLRefreshTool *)refresh{
    if(!_refresh){
        _refresh = [[ZLRefreshTool alloc]initWithContentView:self.collectionView url:kGetApiWithUrl(SSIPcommonFindGoods)];
        _refresh.delegate = self;
        _refresh.showMaskView = YES;
        _refresh.isDataInside = YES;
        [_refresh setBlockEditFailVIew:^(ZLFailLoadView *failView) {
            failView.backgroundColor = [UIColor whiteColor];
            failView.lblOfNodata.text = @"没有产品";
        }];
    }
    return _refresh;
}

- (SSFilterGoodView *)filterView{
    if(!_filterView){
        _filterView = [[SSFilterGoodView alloc]initWithFrame:CGRectMake(0, kMeNavBarHeight, SCREEN_WIDTH, kSSFilterGoodViewHeight)];
        _filterView.delegate = self;
    }
    return _filterView;
}

- (UIImageView *)imgStore{
    if(!_imgStore){
        _imgStore = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-k15Margin-kImgCuster, SCREEN_HEIGHT-(k50WH*2)-kImgCuster, kImgCuster, kImgCuster)];
        _imgStore.cornerRadius = kImgCuster/2;
        _imgStore.image = [UIImage imageNamed:@"chatCustomer"];
        _imgStore.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toCusromer)];
        [_imgStore addGestureRecognizer:ges];
    }
    return _imgStore;
}

@end
