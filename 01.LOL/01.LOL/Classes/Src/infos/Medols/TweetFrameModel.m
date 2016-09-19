//
//  TweetFrameModel.m
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "TweetFrameModel.h"
#import "StringConstants.h"
#define marginY 6   //水平方向的间距
#define marginX 10  //垂直方向的间距


@implementation TweetFrameModel
-(void)setModel:(TweetModel *)model
{
    _model = model;
    
    self.iconFrame = CGRectMake(marginX, marginY, 70, 70);
    
    // 4个视图x的起点
    CGFloat originX = CGRectGetMaxX(self.iconFrame) + marginX;
    // 3个label的宽度
    CGFloat width = WIDTH - originX - marginX;
    
    self.autherFrame = CGRectMake(originX, marginY, width, 24);
    
    // body
    // 计算真正高度 (字号大小一定要和ui视图中的条件保证一致)
    CGSize size = [model.body boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} context:nil].size;
    self.bodyFrame = CGRectMake(originX, CGRectGetMaxY(self.autherFrame) + marginY, width, size.height);
    
    // smallimage
    if(model.imgSmall.length > 0){
        self.smallImageFrame = CGRectMake(originX, CGRectGetMaxY(self.bodyFrame) + marginY, 120, 120);
    }
    else{
        self.smallImageFrame = CGRectMake(originX, CGRectGetMaxY(self.bodyFrame), 120, 0);
    }
    
    //time
    self.timeFrame = CGRectMake(originX, CGRectGetMaxY(self.smallImageFrame) + marginY, width, 20);
    
    // cell总高度
    self.totalHeight = CGRectGetMaxY(self.timeFrame) + marginY;
}

@end
