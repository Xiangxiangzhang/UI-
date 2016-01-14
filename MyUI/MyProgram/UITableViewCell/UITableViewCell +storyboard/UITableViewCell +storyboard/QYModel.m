//
//  QYModel.m
//  UITableViewCell +storyboard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYModel.h"

@implementation QYModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if ( self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
