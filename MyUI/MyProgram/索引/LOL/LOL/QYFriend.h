//
//  QYFriend.h
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriend : NSObject
//声明属性
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *intro;
@property (nonatomic) BOOL vip;

//初始化方法
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendWithDictionary:(NSDictionary *)dict;

@end
