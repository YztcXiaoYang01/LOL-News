
//
//  HerosListViewController.m
//  01.LOL
//
//  Created by 阳new pc on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "HerosListViewController.h"
#import "NetManager.h"
#import "UrlDefine.h"
#import "Tools.h"
#import "HeroModel.h"
#import "MagicalRecord.h"
#import "StringConstants.h"
#import "HeroCell.h"
#define GAP 5   //间距
#define COLUM 2 //列数
#import "HeroModel.h"
@interface HerosListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UISearchBarDelegate>
{

    NSMutableArray *_arrayDS;
    NSArray *_searchReseultArr;//搜索结果
    UICollectionView *_collectionView;
    UISearchBar *_searchBar;
    BOOL _isAction;//用来记录搜索框的状态

}
@end

@implementation HerosListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}


- (void)initData
{

    NSArray *arr = [HeroModel MR_findAll];
    if (arr.count >0) {
//   有缓存
        _arrayDS = [[NSMutableArray alloc]initWithArray:arr];
    }else{
//    没有缓存
        [self downloadData];

    
    }
    
}
#pragma mark ------------初始化视图
- (void)initUI
{
    
//    添加搜索框
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,64, WIDTH, 44)];
    _searchBar.placeholder = @"请输入英雄的名字";
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    
    
    [self.view addSubview:_searchBar];
    
    
//    创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 创建网格视图
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64+44, WIDTH, HEIGHT - 49-64-44)collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    // 注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"HeroCell" bundle:nil] forCellWithReuseIdentifier:@"HeroCell"];
    
    
//    添加搜索框


}

#pragma mark ---------搜索框
//用来记录搜索框的编辑状态
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    _isAction = YES;
}

//文本内容发生改变被调用的方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS %@",searchText];
    _searchReseultArr = [HeroModel MR_findAllWithPredicate:predicate];
//   刷新表
    [_collectionView reloadData];

}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{     _isAction = NO;
    [_collectionView reloadData];
    
    [_searchBar resignFirstResponder];


}
#pragma mark------------瀑布流代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if (_isAction) {
        return _searchReseultArr.count;
    }
    return _arrayDS.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeroCell" forIndexPath:indexPath];
    if (_isAction) {
        cell.model = _searchReseultArr[indexPath.row];
    }else{
    
        cell.model = _arrayDS[indexPath.row];

        
        
        
    }
    return cell;

}

#pragma mark--------视图布局

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (WIDTH - COLUM *2*GAP)/COLUM;

    return CGSizeMake(width, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

return UIEdgeInsetsMake(GAP, GAP, GAP, GAP);

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{

    return 10;


}

#pragma mark -------------下载数据
- (void)downloadData
{
    NSString *urlStr;
    if (self.type == LimitHero) {
        urlStr = kFreeHeroUrlString;
    }else{
        urlStr = kAllHeroUrlString;
    }
    [NetManager GET:urlStr parameters:nil success:^(id responseObject) {
        //    解析数据
        [self parseData:responseObject];
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error.description);
    }];
    
    
    
}
- (void)parseData:(NSData*)data
{
    //容错
    
    if (!data) {
        return;
    }
    
    NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *errorcode = root[@"error_code"];
    if ([errorcode integerValue]==0) {
        
        _arrayDS = [NSMutableArray new];
        for (NSDictionary *dic in root[@"result"]) {
            HeroModel *model = [HeroModel MR_createEntity];
            
            
            model.myId = dic[@"id"];
            model.name_c = dic[@"name_c"];
            model.img = dic[@"img"];
            model.title = dic[@"title"];
            model.tags = dic[@"tags"];
            
            
            [_arrayDS addObject:model];
            
        }
        
        //        将数据存储
        [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
        
        //        刷新UI
        
        [_collectionView reloadData];
    }else{
        
        [Tools showAlertMessage:@"数据解析不成功" byController:self];
        
    }
    
}


@end
