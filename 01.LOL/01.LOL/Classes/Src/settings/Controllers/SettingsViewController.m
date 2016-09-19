
//
//  SettingsViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSMutableArray *_arrayDS;


}
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"settingList" ofType:@"plist"];
    _arrayDS = [[NSMutableArray alloc]initWithContentsOfFile:path];
    
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

static NSString *Indentfire = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Indentfire];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Indentfire];
    }
    NSDictionary *dic = [_arrayDS[indexPath.section] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = dic[@"title"];
    cell.detailTextLabel.text = dic[@"desc"];
    return cell;
}

@end
