
//
//  FriendCircleViewController.m
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "FriendCircleViewController.h"
#import "RDVTabBarController.h"
#import "UrlDefine.h"
#import "GDataXMLNode.h"

#import "TweetModel.h"
#import "TweetFrameModel.h"
#import "TweetCell.h"
@interface FriendCircleViewController ()

{
    NSMutableArray *_arrayDS;

}

@end

@implementation FriendCircleViewController
#pragma mark-----------------------tabBar隐藏
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    隐藏tableBar
    self.rdv_tabBarController.tabBarHidden = YES;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @" 朋友圈";
    // Uncomment the following line to preserve selection between presentations.
    _arrayDS = [[NSMutableArray alloc]init];

     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[TweetCell class] forCellReuseIdentifier:@"TweetCell"];
    
    
    [self downLodeData];
}
#pragma  mark ----------------下载数据
- (void)downLodeData
{

    NSString *urlStr = kFriendCircleUrlString;
    
    [NetManager GET:urlStr parameters:nil success:^(id responseObject) {
//    解析数据
        [self parseData:responseObject];
    } failure:^(NSError *error) {
        NSLog(@"infoError = %@",error.description);
        
    }];

}
#pragma  mark-------------数据解析XML
- (void)parseData:(NSData*)data
{
    if (!data) {
        return;
    }
    GDataXMLDocument *root = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    NSArray *tweetArr = [root nodesForXPath:@"//tweet" error:nil];
    
    for (GDataXMLElement *ele in tweetArr) {
        
        TweetFrameModel *tfmodle = [[TweetFrameModel alloc]init];
        tfmodle.model =[[TweetModel alloc]initTweetModelByGdataXMLElement:ele];
        
        [_arrayDS addObject:tfmodle];
        
    }
//刷新UI
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayDS.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TweetFrameModel *tfModel = _arrayDS[indexPath.row];
    
//     通过infos得到各个控件的frame，进而得到cell的的总高度
    return tfModel.totalHeight;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    // 传递数据
    cell.tfModel = _arrayDS[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;c
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
