//
//  TweetFrameModel.h
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TweetModel.h"
/*
 
 根据信息计算cell上各UI控件的frames
 计算出cell的总高度
 */
@interface TweetFrameModel : NSObject
@property (nonatomic, strong)TweetModel *model;

//frames
@property (nonatomic, assign)CGFloat totalHeight;

@property (nonatomic, assign)CGRect iconFrame;
@property (nonatomic, assign)CGRect autherFrame;
@property (nonatomic, assign)CGRect bodyFrame;
@property (nonatomic, assign)CGRect smallImageFrame;
@property (nonatomic, assign)CGRect timeFrame;


@end
