//
//  ADCell.h
//  01.LOL
//
//  Created by 阳new pc on 16/7/7.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADCellDelegate <NSObject>

-(void)didSelectAdCellWithId:(NSString*)newsId;

@end
@interface ADCell : UITableViewCell
@property (nonatomic, strong)NSMutableArray *adSourceArr;
@property (nonatomic, weak)id <ADCellDelegate>delegate;
@end
