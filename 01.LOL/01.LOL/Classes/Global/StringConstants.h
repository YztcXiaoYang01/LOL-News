//
//  StringConstants.h
//  1_ChangeColor
//
//  Created by RichyLeo on 16/6/15.
//  Copyright © 2016年 WTC. All rights reserved.
//

#ifndef StringConstants_h
#define StringConstants_h

/**
 *  获取屏幕的宽高
 */
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

//RGB色值
#define  UICOLOR_RGB(r,g,b,al)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:al]

#define Defalt_image [UIImage imageNamed:@"icon.png"] 

#endif /* StringConstants_h */
