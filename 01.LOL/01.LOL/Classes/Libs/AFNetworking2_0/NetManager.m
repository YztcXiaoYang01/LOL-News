//
//  NetManager.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailedBlock)failure
{
    //  创建请求管理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//     将responseObject 通过block传递到listVC中
        if (success) {
            success(responseObject);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error = %@",error.description);
        if (failure) {
            failure(error);
        }
        
    }];


}


//POST

+ (void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailedBlock)failure
{
    //  创建请求管理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //     将responseObject 通过block传递到listVC中
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"Error = %@",error.description);
        if (failure) {
            failure(error);
        }
        
    }];
    
    
}

@end
