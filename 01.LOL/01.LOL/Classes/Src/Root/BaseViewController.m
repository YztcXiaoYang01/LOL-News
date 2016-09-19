


//
//  BaseViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    状态栏修改2
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

#pragma mark --------------------状态栏修改1
- (UIStatusBarStyle)preferredStatusBarStyle
{

    return UIStatusBarStyleLightContent;

}
@end
