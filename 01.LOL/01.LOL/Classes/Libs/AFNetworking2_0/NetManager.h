//
//  NetManager.h
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^SuccessBlock) (id responseObject);
typedef void (^FailedBlock) (NSError *error);

@interface NetManager : NSObject
+ (void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailedBlock)fail;
+ (void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailedBlock)failure;

@end
