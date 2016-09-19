//
//  HeroModel.m
//  01.LOL
//
//  Created by 阳new pc on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

// Insert code here to add functionality to your managed object subclass
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"]){
        self.myId = value;
    }
}

@end
