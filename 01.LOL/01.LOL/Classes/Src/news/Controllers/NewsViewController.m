
//
//  NewsViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsListViewController.h"
#import "SCNavTabBarController.h"
#import "StringConstants.h"
@interface NewsViewController ()

@end

@implementation NewsViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  self.navigationController.navigationBarHidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_RGB(55, 63, 80, 1);
    NSArray *titleArr = @[@"最新",
                          @"活动",
                          @"赛事",
                          @"视频",
                          @"娱乐",
                          @"官方",
                          @"美女",
                          @"攻略"];
    
    NSMutableArray *listArr = [NSMutableArray new];
//    8个列表页面
    for (NSInteger i = 0; i < 8; i++) {
        NewsListViewController *listVC = [[NewsListViewController alloc]init];
        listVC.type = i;
        listVC.title = titleArr[i];
        
        [listArr addObject:listVC];
    }
    
//  创建SCNavtabBarController
    SCNavTabBarController *scNavTBC = [[SCNavTabBarController alloc]initWithSubViewControllers:listArr];
    scNavTBC.navTabBarColor = UICOLOR_RGB(33, 43, 60, 1);
    
    [scNavTBC addParentController:self];
    
    
}


@end
