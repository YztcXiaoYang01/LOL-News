//
//  UIColor+RandomColor.m
//  1_ChangeColor
//
//  Created by RichyLeo on 16/6/15.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+(UIColor *)randomColor
{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;

    UIColor * color = [UIColor colorWithRed:r green:g blue:b alpha:1];
    return color;
}

@end
