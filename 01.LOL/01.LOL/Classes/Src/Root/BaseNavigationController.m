//
//  BaseNavigationController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "BaseNavigationController.h"
#import "StringConstants.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.增加导航条背景
    [self.navigationBar setBarTintColor:UICOLOR_RGB(33, 39, 53, 1)];
    
//    2.navbar上文字属性修改
    
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:24.f],NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    
}

@end
