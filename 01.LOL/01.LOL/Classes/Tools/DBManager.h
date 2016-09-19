//
//  DBManager.h
//  2_FMDB使用
//
//  Created by RichyLeo on 16/7/2.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "NewsModel.h"

@interface DBManager : NSObject

// 数据库
@property (nonatomic, strong) FMDatabase * database;

+(DBManager *)sharedManager;

// insert
-(void)insertDataModel:(NewsModel *)model;


// select
-(NSArray *)findAll;

- (BOOL)isExisisForModel:(NSString *)newsId;
- (void)deletDataModel: (NSString *)newsId;

@end
