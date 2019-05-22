//
//  SSUploadArticlDetailVC.m
//  BONEDE
//
//  Created by hank on 2019/5/14.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSUploadArticlDetailVC.h"
#import "SSUploadArticlDetailCell.h"

@interface SSUploadArticlDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SSUploadArticlDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"上传文章";
    [self.view addSubview:self.webView];
    [self.view addSubview:self.tableView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://mp.weixin.qq.com/s/RPbpRjp7dLoRfsaYk1QhcA"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.f]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    static  NSString * const jsGetImages =
    @"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    var imgScr = '';\
    for(var i=0;i<objs.length;i++){\
        if(objs[i].src.substr(0,4).toLowerCase() == \"http\" ){\
            imgScr = imgScr + objs[i].src + '+'\
        }\
    }\
    return imgScr;\
    };";
    
    [webView stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
    NSString *urlResurlt = [webView stringByEvaluatingJavaScriptFromString:@"getImages()"];
    NSMutableArray *mUrlArray = [NSMutableArray arrayWithArray:[urlResurlt componentsSeparatedByString:@"+"]];
    NSLog(@"mUrlArray = %@",mUrlArray[0]);
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@",title);
    NSString *thisHtml = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerHTML"];;//页面信息
     NSLog(@"text = %@",thisHtml);
}

#pragma mark - tableView deleagte and sourcedata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSUploadArticlDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SSUploadArticlDetailCell class]) forIndexPath:indexPath];
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSSUploadArticlDetailCellheight;
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kMeNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kMeNavBarHeight) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SSUploadArticlDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SSUploadArticlDetailCell class])];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _webView.delegate = self;
        _webView.opaque = NO;
        _webView.scalesPageToFit =YES;
        _webView.backgroundColor = [UIColor whiteColor];
    }
    return _webView;
}
@end
