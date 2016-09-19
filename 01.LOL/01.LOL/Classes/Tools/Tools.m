//
//  Tools.m
//  4_Tools
//
//  Created by RichyLeo on 16/6/14.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "Tools.h"

@implementation Tools

// 创建Label
+(UILabel *)createLabelTitle:(NSString *)title
                       frame:(CGRect)frame
                        font:(UIFont *)font
               textAlignment:(NSTextAlignment)alignment
{
    UILabel * label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    label.textAlignment = alignment;
    label.font = font;
    
    return label;
}

/**
 *  创建文字性的按钮
 */
+(UIButton *)createTitleButton:(NSString *)title
                         frame:(CGRect)frame
                        target:(id)target
                        action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


//创建UITextField

+ (UITextField*)createTextFieldFrame:(CGRect)frame placeholder:(NSString *)planceholderText textAlignment:(NSTextAlignment)textAlign font:(UIFont*)font
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    
    textField.placeholder = planceholderText;
    textField.textAlignment = textAlign;
    textField.font = font;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

//温馨提示
+(void)showAlertMessage:(NSString *)msg byController:(UIViewController *)vc
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // do nothing
    }];
    [alert addAction:sureAction];
    
    [vc presentViewController:alert animated:YES completion:nil];
}




@end
