//
//  NewsModel.h
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "id": "295073",
 "title": "Riot\u51b3\u5fc3\u5df2\u5b9a \u55b7\u5b50\u7684\u65f6\u4ee3\u5c06\u4e00\u53bb\u4e0d\u590d\u8fd4",
 "comment_count": 5,
 "source": "",
 "icon": "http:\/\/userimg.shiwan.com\/uploads\/manage\/9b\/d1\/6c4984d14df700e2347bdd7291128906d522.jpg",
 "short": "[\u6458\u8981
 */
@interface NewsModel : NSObject
@property (nonatomic, copy)NSString *myId;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *comment_count;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *myShort;

@end
