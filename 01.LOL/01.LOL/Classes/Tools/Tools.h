//
//  Tools.h
//  4_Tools
//
//  Created by RichyLeo on 16/6/14.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

// 1.创建Label
+(UILabel *)createLabelTitle:(NSString *)title
                       frame:(CGRect)frame
                        font:(UIFont *)font
               textAlignment:(NSTextAlignment)alignment;

/**
 *  2.创建文字性的按钮
 */
+(UIButton *)createTitleButton:(NSString *)title frame:(CGRect)frame target:(id)target action:(SEL)action;



//3.创建UITextField

+ (UITextField*)createTextFieldFrame:(CGRect)frame placeholder:(NSString *)planceholderText textAlignment:(NSTextAlignment)textAlign font:(UIFont*)font;
//4.温馨提示
+(void)showAlertMessage:(NSString *)msg byController:(UIViewController *)vc;



@end
