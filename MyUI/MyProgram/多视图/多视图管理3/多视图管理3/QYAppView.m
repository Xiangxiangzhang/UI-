//
//  QYAppView.m
//  多视图管理3
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYAppView.h"
#import "QYApp.h"

//类的扩展
@interface QYAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation QYAppView

+ (instancetype)appView
{
    return [[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil][0];
}

//重写set方法，因为默认实现的set方法只有_model=model
-(void) setModel:(QYApp *)model
{
    _model=model;
    
    //设置icon的image
    _icon.image=model.icon;
    
    //设置title的name
    _title.text=model.title;
    
    
}

@end
