//
//  SSEditPosterVC.m
//  BONEDE
//
//  Created by gao lei on 2019/6/6.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import "SSEditPosterVC.h"
#import <TZImagePickerController.h>

@interface SSEditPosterVC ()<UITextFieldDelegate,TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UITextField *titleTF;

@property (nonatomic, copy) NSString *imgPath;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, strong) UIView         *bottomView;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, assign) BOOL isError;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addBtnTopCons;

@end

@implementation SSEditPosterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"海报上传";
    self.isError = NO;
    self.addBtnTopCons.constant = 105*kMeFrameScaleY();
    
    CGRect bounds = self.bgView.layer.bounds;
    CGFloat bgViewWidth = [UIScreen mainScreen].bounds.size.width - 85*2;
    CGFloat bgViewHeight = bgViewWidth*302/205;
    bounds.size.width = bgViewWidth;
    bounds.size.height = bgViewHeight;
    
    CAGradientLayer *btnLayer = [self getLayerWithStartPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1) colors:@[(__bridge id)[UIColor colorWithRed:82/255.0 green:160/255.0 blue:245/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:67/255.0 green:134/255.0 blue:239/255.0 alpha:1.0].CGColor] locations:@[@(0.0),@(1.0)] frame:bounds];
    [self.bgView.layer insertSublayer:btnLayer atIndex:0];
    self.titleTF.delegate = self;
    self.titleTF.returnKeyType = UIReturnKeyDone;
    [self.titleTF addTarget:self action:@selector(tfTextDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:self.bottomView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
    
    kMeWEAKSELF
    MBProgressHUD *HUD = [SSPublicNetWorkTool commitWithHUD:@""];
    [SSPublicNetWorkTool postgetQiuNiuTokkenWithSuccessBlock:^(ZLRequestResponse *responseObject) {
        [HUD hideAnimated:YES];
        kMeSTRONGSELF
        strongSelf.token = responseObject.data[@"token"];
    } failure:^(id object) {
        [SSShowViewTool SHOWHUDWITHHUD:HUD test:kApiError];
        kMeSTRONGSELF
        [strongSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (CAGradientLayer *)getLayerWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint colors:(NSArray *)colors locations:(NSArray *)locations frame:(CGRect)frame {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = startPoint;//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer.endPoint = endPoint;//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer.colors = colors;
    layer.locations = locations;//渐变颜色的区间分布，locations的数组长度和color一致，这个值一般不用管它，默认是nil，会平均分布
    layer.frame = frame;
    return layer;
}
#pragma mark --UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // text field 上实际字符长度
    NSInteger strLength = textField.text.length - range.length + string.length;
    if (textField == self.titleTF) {
        return(strLength <= 10);
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.titleTF resignFirstResponder];
    return YES;
}

- (void)tfTextDidChange:(UITextField *)textField {
    if(textField.text.length > 10){
        textField.text = [textField.text substringWithRange:NSMakeRange(0,10)];
        [SSShowViewTool showMessage:@"标题限10字以内" view:self.view];
        [self.view endEditing:YES];
    }
}

- (void)tapAction {
    [self.view endEditing:YES];
}

- (void)editPoster {
    if ([self.imgPath length] <= 0) {
        [SSShowViewTool showMessage:@"请上传海报图片" view:self.view];
        return;
    }
    
    NSString *content = kMeUnNilStr(self.titleTF.text);
    if(content.length == 0){
        [SSShowViewTool showMessage:@"请输入海报标题" view:self.view];
        return;
    }
    
    kMeWEAKSELF
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    MBProgressHUD *hub =  [SSPublicNetWorkTool commitWithHUD:@"上传中"];
    
    dispatch_group_async(group, queue, ^{
        kMeSTRONGSELF
        [SSPublicNetWorkTool postQiNiuUpFileWithToken:strongSelf.token filePath:strongSelf.imgPath successBlock:^(id object) {
            NSLog(@"%@",object);
            if([object isKindOfClass:[NSDictionary class]]){
                strongSelf.imgUrl = kMeUnNilStr(object[@"key"]);
            }else{
                strongSelf.isError = YES;
            }
            dispatch_semaphore_signal(semaphore);
        } failure:^(id object) {
            strongSelf.isError = YES;
            dispatch_semaphore_signal(semaphore);
        }];
    });
    
    dispatch_group_notify(group, queue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        kMeSTRONGSELF
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!strongSelf->_isError){
                [hub hideAnimated:YES];
                [SSPublicNetWorkTool postMyPostersWithStoreId:kMeUnNilStr(kCurrentUser.store_id) title:kMeUnNilStr(strongSelf.titleTF.text) image:kMeUnNilStr(strongSelf.imgUrl) classifyId:@"" successBlock:^(ZLRequestResponse *responseObject) {
                    kMeSTRONGSELF
                    kMeCallBlock(strongSelf.finishBlock);
                    [strongSelf.navigationController popViewControllerAnimated:YES];
                } failure:^(id object) {

                }];
            }else{
                [SSShowViewTool SHOWHUDWITHHUD:hub test:@"海报上传失败"];
            }
        });
    });
}

- (IBAction)postPosterAction:(id)sender {
    
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePicker.allowPickingOriginalPhoto = NO;
    imagePicker.allowPickingVideo = NO;
    kMeWEAKSELF
    [imagePicker setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto, NSArray<NSDictionary *> *infos) {
        kMeSTRONGSELF
        for (int i = 0; i < assets.count; i ++) {
            PHAsset *phAsset = assets[i];
            if (phAsset.mediaType == PHAssetMediaTypeImage) {
                UIImage *image = photos[i];
                NSString *filename = [phAsset valueForKey:@"filename"];
//                            NSURL *url = [info valueForKey:@"PHImageFileURLKey"];
                strongSelf.imgPath = [SSCommonTool getImagePath:image filename:filename];
                strongSelf.imgView.image = [UIImage imageWithContentsOfFile:strongSelf.imgPath];
            }
        }
    }];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-90, SCREEN_WIDTH, 90)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        //阴影效果
        _bottomView.layer.shadowColor = [UIColor colorWithRed:22/255.0 green:157/255.0 blue:255/255.0 alpha:0.36].CGColor;
        _bottomView.layer.shadowOffset = CGSizeMake(0,0);
        _bottomView.layer.shadowOpacity = 1;
        _bottomView.layer.shadowRadius = 14;
        
        UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [postBtn setFrame:CGRectMake(15, 25, SCREEN_WIDTH - 30, 40)];
        [postBtn setBackgroundColor:[UIColor colorWithHexString:@"#169DFF"]];
        [postBtn setTitle:@"  生成海报" forState:UIControlStateNormal];
        [postBtn.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Bold" size:16]];
        [postBtn setImage:[UIImage imageNamed:@"icon_edit"] forState:UIControlStateNormal];
        [postBtn addTarget:self action:@selector(editPoster) forControlEvents:UIControlEventTouchUpInside];
        postBtn.layer.cornerRadius = 20;
        postBtn.layer.shadowColor = [UIColor colorWithRed:22/255.0 green:157/255.0 blue:255/255.0 alpha:0.36].CGColor;
        postBtn.layer.shadowOffset = CGSizeMake(0,3);
        postBtn.layer.shadowOpacity = 1;
        postBtn.layer.shadowRadius = 10;
        [_bottomView addSubview:postBtn];
    }
    return _bottomView;
}
@end
