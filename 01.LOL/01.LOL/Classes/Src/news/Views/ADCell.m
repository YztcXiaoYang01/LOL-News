
//
//  ADCell.m
//  01.LOL
//
//  Created by 阳new pc on 16/7/7.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "ADCell.h"
#import "SDCycleScrollView.h"
#import "StringConstants.h"
#import "ADModel.h"
#import "NSString+URLEncoding.h"
@interface ADCell ()<SDCycleScrollViewDelegate>
{

    SDCycleScrollView *_adCycleView;//广告图

}
@end
@implementation ADCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }

    return self;

}
- (void)setup
{

    _adCycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 160) imagesGroup:nil];
    _adCycleView.delegate = self;
    _adCycleView.showPageControl = YES;
    _adCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    [self.contentView addSubview:_adCycleView];


}
//点击广告调用的方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

    ADModel *model = _adSourceArr[index];
    
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectAdCellWithId:)]) {
        [_delegate didSelectAdCellWithId:model.article_id];
    }
    

}

- (void)setAdSourceArr:(NSMutableArray *)adSourceArr
{

    _adSourceArr = adSourceArr;
    
    NSMutableArray *imageArr = [[NSMutableArray alloc]init];
    NSMutableArray *titleArr = [[NSMutableArray alloc]init];
    
    for (ADModel * model  in _adSourceArr) {
        [imageArr addObject:[model.ban_img URLDecodedString]];
        [titleArr addObject:model.name];
    }
    
    _adCycleView.imageURLStringsGroup = imageArr;
    _adCycleView.titlesGroup = titleArr;



}
@end
