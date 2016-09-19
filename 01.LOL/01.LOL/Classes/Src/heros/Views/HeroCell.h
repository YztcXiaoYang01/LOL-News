//
//  HeroCell.h
//  01.LOL
//
//  Created by 阳new pc on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroModel.h"
@interface HeroCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLable;

@property (strong, nonatomic) IBOutlet UILabel *descLable;

@property (strong, nonatomic) IBOutlet UILabel *detLable;

@property (nonatomic,strong)HeroModel *model;
@end
