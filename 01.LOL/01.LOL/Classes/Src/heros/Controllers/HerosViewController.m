//
//  HerosViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "HerosViewController.h"
#import "StringConstants.h"
#import "HerosListViewController.h"
@interface HerosViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UISegmentedControl *_sgControl;

}
@end

@implementation HerosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
 
    
    [self initNavBar];
    [self initUI];
}

#pragma mark --------初始化
- (void)initNavBar
{

    _sgControl = [[UISegmentedControl alloc]initWithItems:@[@"本周限免",@"全部英雄"]];
    _sgControl.selectedSegmentIndex = 0;

    [_sgControl addTarget:self action:@selector(segmentedControAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView =_sgControl;


}
- (void)initUI
{
    //    背景的滑动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49)];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    //    添加两个列表页面
    
    for (NSInteger i =0; i<2; i++) {
        HerosListViewController *lvc = [[HerosListViewController alloc]init];
        
        //        增加页面标记
        lvc.type = i ;
        
        //        添加子控制器
        [self addChildViewController:lvc];
        
        //    设置列表页面的大小位置
        lvc.view.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT-49);
        [_scrollView addSubview:lvc.view];
        
        
    }
    
    _scrollView.contentSize = CGSizeMake(WIDTH*2, HEIGHT-49);
    
}

//点击方法
- (void)segmentedControAction:(UISegmentedControl*)sgControl
{

[UIView animateWithDuration:0.5 animations:^{
    _scrollView.contentOffset = CGPointMake(sgControl.selectedSegmentIndex * WIDTH, 0);
}];


}

//减速停止后执行此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger index = scrollView.contentOffset.x/WIDTH;
    
    _sgControl.selectedSegmentIndex = index;


}

@end
