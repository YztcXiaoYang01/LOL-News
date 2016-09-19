//
//  HeroModel+CoreDataProperties.h
//  01.LOL
//
//  Created by sks on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "HeroModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HeroModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *img;
@property (nullable, nonatomic, retain) NSString *myId;
@property (nullable, nonatomic, retain) NSString *name_c;
@property (nullable, nonatomic, retain) NSString *tags;
@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
