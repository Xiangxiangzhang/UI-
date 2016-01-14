//
//  QYPerson.m
//  KVO1
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import "QYPerson.h"

@implementation QYPerson
- (instancetype)init
{
    if (self = [super init]) {
        _name = @"花花";
        _age = 16;
    }
    return self;
}

@end
