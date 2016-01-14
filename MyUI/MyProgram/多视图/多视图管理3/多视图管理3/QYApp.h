//
//  QYApp.h
//  多视图管理3
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
#define kIconKey  @"icon"
#define kTitleKey  @"name"

@interface QYApp : NSObject
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) NSString *title;

//模型对象
+ (instancetype)appWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
