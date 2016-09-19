//
//  NewsDetailViewController.h
//  01.LOL
//
//  Created by 阳new pc on 16/7/7.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "BaseViewController.h"


@interface NewsDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

//从列表页传过来的
@property (nonatomic, copy)NSString *myId;
@end
