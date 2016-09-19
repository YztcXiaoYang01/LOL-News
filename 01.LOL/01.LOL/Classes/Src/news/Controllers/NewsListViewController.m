//
//  NewsListViewController.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NewsListViewController.h"
#import "StringConstants.h"
#import "AFNetworking.h"
#import "UrlDefine.h"
#import "Tools.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "ADModel.h"
#import "ADCell.h"
#import "YCRefreshControl.h"// 刷新
#import "NewsDetailViewController.h"
#import "RDVTabBarController.h"
@interface NewsListViewController ()<UITableViewDataSource,UITableViewDelegate,ADCellDelegate>
{

    UITableView *_tableView;//列表
    NSMutableArray *_arrayDS;//数据源
    NSMutableArray *_arrayAD;//广告数据
    
    NSInteger _currPage;//记录当前页
    BOOL _isup;//记录上拉  下拉
    
}
@end

@implementation NewsListViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.rdv_tabBarController.tabBarHidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
    
}

//初始化数据源
- (void)initData
{
    
    _arrayDS = [[NSMutableArray alloc]init];
    _arrayAD = [[NSMutableArray alloc]init];
    _currPage = 1;//默认加载第一页
    
    
}

- (void)initUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,-20, WIDTH, HEIGHT-49-20-44) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    //    注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    [_tableView registerClass:[ADCell class] forCellReuseIdentifier:@"ADCell"];
    
//    添加下拉刷新
    [self addHeaderAndFooterREfresh];
}
- (void)addHeaderAndFooterREfresh
{
//上拉 footer
    [_tableView yc_setLoadmoreAction:^{
//        触发上拉刷新之后，执行的内容
        _currPage++;
        _isup = YES;
        
        [self downLoadData];
    }];

//下拉刷新
    [_tableView yc_setRefreshAction:^{
        _currPage = 1;
        _isup = NO;
        [self downLoadData];
    }];

    [_tableView yc_beginRefresh];

}
#pragma mark -------------点击cell 的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model = _arrayDS[indexPath.row-1];

    NewsDetailViewController *vc = [[NewsDetailViewController alloc]init];
    vc.myId =model.myId;
    
    [self.navigationController pushViewController:vc animated:YES];


}

#pragma mark ------------列表代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _arrayDS.count+1;//注意加1
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        ADCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ADCell"];
        cell.delegate = self;
        cell.adSourceArr = _arrayAD;
        
        return cell;
    }
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    
    cell.model = _arrayDS[indexPath.row-1];// 注意减1
    
    return cell;
    
}

#pragma mark -------------ADCellDelegate方法
- (void)didSelectAdCellWithId:(NSString *)newsId
{
    NewsDetailViewController *vc = [[NewsDetailViewController alloc]init];
    vc.myId = newsId;
    [self.navigationController pushViewController:vc animated:YES];
 

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 160;
    }
    return 80;
}

#pragma mark---------下载数据
- (void)downLoadData
{
//  网络请求
    NSString *urlStr;
    switch (self.type) {
        case LatestPage:
    urlStr = [NSString stringWithFormat:kLatestNewsUrlString,_currPage];
         break;
        case ActivePage:
            urlStr = [NSString stringWithFormat:kS4UrlString,_currPage];
            break;
        case GamePage:
            urlStr = [NSString stringWithFormat:kMatchUrlStirng,_currPage];
            break;
        case VideoPage:
            urlStr = [NSString stringWithFormat:kGreatUrlString,_currPage];
            break;
        case Enjoypage:
            urlStr = [NSString stringWithFormat:kLolPictureUrlString,_currPage];
            break;
        case OfficalPage:
            urlStr = [NSString stringWithFormat:kOfficialUrlString,_currPage];
            break;
        case BeautyPage:
            urlStr = [NSString stringWithFormat:kBeautifulGirlUrlString,_currPage];
            break;
        case StrategyPage:
            urlStr = [NSString stringWithFormat:kStrategyUrlString,_currPage];
            break;
            
        default:
            break;
    }
    
    [NetManager GET:urlStr parameters:nil success:^(id responseObject) {
        [self parseData:responseObject];
    } failure:^(NSError *error) {
        
        [Tools showAlertMessage:@"加载不成功" byController: self];
    }];



}
//数据解析
- (void)parseData:(NSData*)data
{

//    逻辑判断，容错处理
    if (!data) {
        
        return ;
    } else{
    
        NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString * errorCode = root[@"error_code"];
        
//     处理数据源
        if (!_isup) {
            [_arrayAD removeAllObjects];
            [_arrayDS removeAllObjects];
        }
        
        if ([errorCode integerValue]==0) {
//       cell lists
            for (NSDictionary *cellDic  in root[@"result"]) {
                NewsModel *model = [[NewsModel alloc]init];
                
                [model setValuesForKeysWithDictionary:cellDic];
              
                [_arrayDS addObject:model];
                
            }
            
//       ad list
            for (NSDictionary *adDic in root[@"recomm"]) {
                ADModel *model = [[ADModel alloc]init];
                
                [model setValuesForKeysWithDictionary:adDic];
                
                [_arrayAD addObject:model];
                
            }
//           刷新UI
            [_tableView reloadData];
//          结束刷新动作
            [_tableView yc_endLoadmore];
            [_tableView yc_endRefresh];
            
            
            
        }else{
        
            [Tools showAlertMessage:@"数据请求失败" byController:self];
        }
    }
}
@end
