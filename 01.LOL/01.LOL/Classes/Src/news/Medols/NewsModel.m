
//
//  NewsModel.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _myId = value;
    }
    
    if ([key isEqualToString:@"short"]) {
        _myShort = value;
    }
    
}

//给未定义的key所对应的值 nil
- (id)valueForUndefinedKey:(NSString *)key
{

    return nil;
}
@end
