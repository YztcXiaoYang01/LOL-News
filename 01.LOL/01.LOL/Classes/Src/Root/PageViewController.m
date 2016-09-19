//
//  PageViewController.m
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "PageViewController.h"
#import "StringConstants.h"
#import "Tools.h"
@interface PageViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;

}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createScrollView];
}
- (void)createScrollView
{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(WIDTH*4, HEIGHT);
    
    
    [self.view addSubview:_scrollView];
    

    for (NSInteger i = 0; i<4; i++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT)];
        imageview.tag = 10+i;
        imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",i]];
        imageview.userInteractionEnabled = YES;
        
        [_scrollView addSubview:imageview];

        if (i==3) {
            UIButton *btn = [Tools createTitleButton:@"立即体验" frame:CGRectMake((WIDTH-150)/2, HEIGHT-100, 150, 40) target:self action:@selector(intAction:)];
            btn.backgroundColor = [UIColor redColor];
            [btn.layer setBorderWidth:2];
            btn.layer.cornerRadius = 20;
            btn.layer.borderColor = [UIColor blackColor].CGColor;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
            
            
            UIImageView *lastImageView = [_scrollView viewWithTag:10+i];
            [lastImageView addSubview:btn];
        }
        
    }
    


}

- (void)intAction:(UIButton*)btn
{

    
    
    if (_delegate && [_delegate respondsToSelector:@selector(receiveTheViewController:)]) {
        [_delegate receiveTheViewController:self];
    }
    



}
@end
