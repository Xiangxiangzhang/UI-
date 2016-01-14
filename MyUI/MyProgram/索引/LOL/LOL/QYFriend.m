//
//  QYFriend.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYFriend.h"

@implementation QYFriend

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if ( self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
    
}


@end
