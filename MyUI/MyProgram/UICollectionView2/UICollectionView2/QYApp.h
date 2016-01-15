//
//  QYApp.h
//  UICollectionView2
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
#define kIconKey @"icon"
#define kTitleKey @"name"

@interface QYApp : NSObject
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;



@end
