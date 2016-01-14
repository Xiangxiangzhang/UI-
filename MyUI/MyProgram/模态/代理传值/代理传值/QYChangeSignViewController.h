//
//  QYChangeSignViewController.h
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYChangeLabelValue.h"

@interface QYChangeSignViewController : UIViewController
//属性传值
@property (nonatomic,strong) NSString *descString;

//声明代理属性，遵守QYChangeLabeValue协议
@property (nonatomic,assign) id <QYChangeLabelValue> delegate;


@end
