//
//  PageViewController.h
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageViewControllerDelegate <NSObject>

- (void)receiveTheViewController:(UIViewController*)controller;

@end
@interface PageViewController : UIViewController
@property (nonatomic, weak)id<PageViewControllerDelegate>delegate;
@end
