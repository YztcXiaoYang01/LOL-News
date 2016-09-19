//
//  EnumConstants.h
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#ifndef EnumConstants_h
#define EnumConstants_h

//新闻页面－类型

typedef enum :NSInteger{
  LatestPage = 0,   //最新
    ActivePage,     //活动
    GamePage,       //赛事
    VideoPage,      //视频
    Enjoypage,      //娱乐
    OfficalPage,    //官方
    BeautyPage,     //美女
    StrategyPage    //攻略



}PageType;

//英雄页面

typedef enum:  NSInteger{

    LimitHero = 0,//本周限免
    AllHero       //全部英雄


}HeroType;

#endif /* EnumConstants_h */
