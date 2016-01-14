//
//  FriendGroup.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"
@implementation FriendGroup

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            Friend *friend = [Friend friendWithDictionary:dic];
            [array addObject:friend];
        }
        self.friends = array;
        self.isopen = NO;
    }
    return self;
}
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}

@end
