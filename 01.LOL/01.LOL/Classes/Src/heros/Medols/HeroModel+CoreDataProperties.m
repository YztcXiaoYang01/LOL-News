//
//  HeroModel+CoreDataProperties.m
//  01.LOL
//
//  Created by sks on 16/7/8.
//  Copyright © 2016年 Yang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "HeroModel+CoreDataProperties.h"

@implementation HeroModel (CoreDataProperties)

@dynamic img;
@dynamic myId;
@dynamic name_c;
@dynamic tags;
@dynamic title;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"]){
        self.myId = value;
    }
}

@end
