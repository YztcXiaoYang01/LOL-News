//
//  NewsDetailViewController.m
//  01.LOL
//
//  Created by 阳new pc on 16/7/7.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "UrlDefine.h"
#import "RDVTabBarController.h"
#import "SVProgressHUD.h"
@interface NewsDetailViewController ()<UIWebViewDelegate>

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlStr = [NSString stringWithFormat:kNewsDetailUrlString,_myId];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    
    self.navigationItem.title = @"新闻详情";
        
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    显示导航条
    self.navigationController.navigationBarHidden = NO;
//    二级页面，隐藏tabbar
    self.rdv_tabBarController.tabBarHidden = YES;
    
}

#pragma mark----------  UIWebViewDelegate 的代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//应用程序活动指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD showWithStatus:@"网页正在加载中......."];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

//关闭网络活动指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    [SVProgressHUD dismiss];


}


@end
