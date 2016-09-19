//
//  NewsCell.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+AFNetworking.h"
#import "StringConstants.h"
#import "DBManager.h"
@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NewsModel *)model
{

    _model = model;
    [_iconImageView setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:Defalt_image];
    _titleLable.text = model.title;
    _descLable.text = model.myShort;

    if ([[DBManager sharedManager] isExisisForModel:_model.myId]) {
        [self.likeButton setTitle:@"Cancel" forState:UIControlStateNormal];
    }else{
    
        [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];

    
    }


}

- (IBAction)likeAction:(id)sender {
    
    UIButton *likeBtn = (UIButton *)sender;
    
    if ([[DBManager sharedManager] isExisisForModel:_model.myId]) {
//有数据，delete  Like
        [[DBManager sharedManager] deletDataModel:_model.myId];
        [likeBtn setTitle:@"Like" forState:UIControlStateNormal];
  
  
    }else{
// 没有数据  insert cancel
        [[DBManager sharedManager] insertDataModel:_model];
        [likeBtn setTitle:@"Cancell" forState:UIControlStateNormal];

    }
    
}

@end
