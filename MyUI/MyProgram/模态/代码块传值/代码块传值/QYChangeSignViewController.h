//
//  QYChangeSignViewController.h
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYChangeSignViewController : UIViewController
//属性传值
@property (nonatomic,strong) NSString *descString;

//定义block块
@property (nonatomic,strong) void (^changeLabelValue) (NSString *text);

@end
