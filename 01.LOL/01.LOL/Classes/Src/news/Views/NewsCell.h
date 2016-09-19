//
//  NewsCell.h
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *descLable;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;
@property (nonatomic, strong)NewsModel *model;
@end
