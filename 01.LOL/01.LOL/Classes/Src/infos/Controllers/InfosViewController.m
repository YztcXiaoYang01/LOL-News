
//
//  InfosViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "InfosViewController.h"
#import "FriendCircleViewController.h"
#import "RDVTabBarController.h"
@interface InfosViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_arrayDS;//数据源

}

@end

@implementation InfosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    加载数据源
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"infoCell" ofType:@"plist"];
    _arrayDS = [[NSMutableArray alloc]initWithContentsOfFile:path];
}
- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    self.rdv_tabBarController.tabBarHidden = NO;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayDS.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_arrayDS[section] count];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

static NSString *Indentfire = @"InfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Indentfire];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Indentfire];
        
    }
    
    NSDictionary *dic = [_arrayDS[indexPath.section] objectAtIndex:indexPath.row];

    cell.imageView.image = [UIImage imageNamed:dic[@"iconImage"]];
    cell.textLabel.text = dic[@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//展示朋友圈
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self showFriendCircle];
    }


}
#pragma mark---------------各个cell上的功能
- (void)showFriendCircle
{
    FriendCircleViewController *fvc = [[FriendCircleViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];

}
@end
