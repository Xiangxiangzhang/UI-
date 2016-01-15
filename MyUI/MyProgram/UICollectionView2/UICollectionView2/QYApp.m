//
//  QYApp.m
//  UICollectionView2
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//
#import <UIKit/UIImage.h>
#import "QYApp.h"

@implementation QYApp
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _icon = [UIImage imageNamed:dict[kIconKey]];
        _name= dict[kTitleKey];
    }
    return self;
}
+ (instancetype)appWithDict:(NSDictionary *)dict
{
    return [[QYApp alloc] initWithDict:dict];
}



@end
