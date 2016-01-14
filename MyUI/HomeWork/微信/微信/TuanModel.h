//
//  TuanModel.h
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuanModel : NSObject

@property (nonatomic,strong) NSString *buycount;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *title;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)tuanModelWithDictionary:(NSDictionary *)dict;

@end
