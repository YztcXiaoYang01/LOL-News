
//
//  RootViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "RootViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "RDVTabBarItem.h"
#import "StringConstants.h"
@interface RootViewController ()
{

    NSArray *_titleArr;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addControllers];
    
}

- (void)addControllers
{

    NSArray *classNameArr = @[@"NewsViewController",
                              @"HerosViewController",
                              @"InfosViewController",
                              @"SettingsViewController"];
// 临时存储
    _titleArr = @[@"新闻",@"英雄",@"资料",@"设置"];

    NSInteger index= 0;
    NSMutableArray *controllers = [NSMutableArray new];
    for (NSString *className in classNameArr) {
        Class cls = NSClassFromString(className);
        BaseViewController *vc = [[cls alloc]init];
        vc.title = _titleArr[index];
        BaseNavigationController *nvc = [[BaseNavigationController alloc]initWithRootViewController:vc];
        [controllers addObject:nvc];
        index++;
    }
//添加到标签控制器下
    self.viewControllers = controllers;

//tabbar
    [self configTabbar];

}

- (void)configTabbar
{
    NSDictionary *selectedTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:9.0f],NSForegroundColorAttributeName :UICOLOR_RGB(68, 135, 194, 1)};
    NSDictionary *unselectedTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:9.0F], NSForegroundColorAttributeName : UICOLOR_RGB(181, 186, 195, 1)};
    
    NSArray *imageArr = @[@"tab_icon_news",@"tab_icon_friend",@"tab_icon_quiz",@"tab_icon_more"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in self.tabBar.items) {
//文字
        item.title = _titleArr[index];
        item.selectedTitleAttributes =selectedTitleAttributes;
        item.unselectedTitleAttributes =unselectedTitleAttributes;
//图片
        [item setFinishedSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_press.png",imageArr[index]]] withFinishedUnselectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal.png",imageArr[index]]]];
        
        index++;

    }

}
@end
