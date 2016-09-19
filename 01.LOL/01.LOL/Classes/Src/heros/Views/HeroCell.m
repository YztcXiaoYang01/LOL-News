//
//  HeroCell.m
//  01.LOL
//
//  Created by 阳new pc on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "HeroCell.h"
#import "UIImageView+AFNetworking.h"
#import "StringConstants.h"
@interface HeroCell ()


@end
@implementation HeroCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(HeroModel *)model
{

    _model = model;
    
    [_iconImageView setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:Defalt_image];
    _titleLable.text = model.title;
    _descLable.text = model.name_c;
    _detLable.text = model.tags;
    



}
@end
