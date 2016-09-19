//
//  TweetCell.m
//  01.LOL
//
//  Created by sks on 16/7/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "StringConstants.h"
@interface TweetCell ()
{

    UIImageView *_iconImageView;
    UILabel *_autherLabel;
    UILabel *_bodyLabel;
    
    UIImageView *_smallImageView;
    UILabel *_timeLabel;

}
@end
@implementation TweetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        复用的布局
        [self setUp];
    }


    return self;
}


- (void)setUp
{
//    头像
    _iconImageView = [UIImageView new];
    [self.contentView addSubview:_iconImageView];
    
//    作者
    _autherLabel = [UILabel new];
    _autherLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.contentView addSubview:_autherLabel];
    
//    详情
    _bodyLabel = [UILabel new];
    _bodyLabel.font = [UIFont systemFontOfSize:14.0f];
    _bodyLabel.numberOfLines = 0;
    [self.contentView addSubview:_bodyLabel];
    
//    小图
    _smallImageView = [UIImageView new];
    _smallImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_smallImageView];
    
//    时间
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont systemFontOfSize:14.0f];
    _timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_timeLabel];
    

}

//数据填充
- (void)setTfModel:(TweetFrameModel *)tfModel
{

    _tfModel = tfModel;
    
//    infos
    [_iconImageView setImageWithURL:[NSURL URLWithString:tfModel.model.portrait] placeholderImage:Defalt_image];
    _autherLabel.text = tfModel.model.author;
    _bodyLabel.text = tfModel.model.body;
    [_smallImageView setImageWithURL:[NSURL URLWithString:tfModel.model.imgSmall] placeholderImage:Defalt_image];
    _timeLabel.text = tfModel.model.pubDate;
    
    
//    frames
    _iconImageView.frame = tfModel.iconFrame;
    _autherLabel.frame = tfModel.autherFrame;
    _bodyLabel.frame = tfModel.bodyFrame;
    _smallImageView.frame = tfModel.smallImageFrame;
    _timeLabel.frame = tfModel.timeFrame;



}

@end
