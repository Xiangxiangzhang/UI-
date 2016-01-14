//
//  FriendGroup.h
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic) BOOL isopen;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict;


@end
