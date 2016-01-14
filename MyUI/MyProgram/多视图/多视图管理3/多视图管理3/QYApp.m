//
//  QYApp.m
//  多视图管理3
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYApp.h"
#import <UIKit/UIImage.h>

@implementation QYApp

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        _icon=[UIImage imageNamed:dict[kIconKey]];
        _title=dict[kTitleKey];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict
{
    
    return [[QYApp alloc] initWithDict:dict];
}

@end
