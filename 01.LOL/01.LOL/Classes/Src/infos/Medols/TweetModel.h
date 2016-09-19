//
//  TweetModel.h
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
@interface TweetModel : NSObject
@property (nonatomic, copy)NSString *myId;
@property (nonatomic, copy)NSString *portrait;//头像
@property (nonatomic, copy)NSString *author;  //作者
@property (nonatomic, copy)NSString *authorid;
@property (nonatomic, copy)NSString *body;    //正文

@property (nonatomic, copy)NSString *appclient;
@property (nonatomic, copy)NSString *commentCount;
@property (nonatomic, copy)NSString *pubDate;  //时间
@property (nonatomic, copy)NSString *likeCount;
@property (nonatomic, copy)NSString *isLike;
@property (nonatomic, copy)NSString *imgBig;
@property (nonatomic, copy)NSString *imgSmall;//小图
//将信息传到model 内部进行赋值
- (instancetype)initTweetModelByGdataXMLElement:(GDataXMLElement*)element;
@end
