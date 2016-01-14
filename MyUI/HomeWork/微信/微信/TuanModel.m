//
//  TuanModel.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TuanModel.h"

@implementation TuanModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tuanModelWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
