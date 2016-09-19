


//
//  TweetModel.m
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "TweetModel.h"

@implementation TweetModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"id"]) {
        self.myId = value;
    }
    
    
    
}

- (instancetype)initTweetModelByGdataXMLElement:(GDataXMLElement*)element
{

    if (self = [super init]) {
        for (GDataXMLElement * ele in element.children) {
//            KVC存储数据
            [self setValue:ele.stringValue forKey:ele.name];
        }
    }
    return self;

}
@end
