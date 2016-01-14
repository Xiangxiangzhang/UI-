//
//  ViewController.m
//  多视图管理3
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYApp.h"
#import "QYAppView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic,strong) NSArray *apps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //总列数
    int totalColumn = 4;
    
    //appView的宽度和高度
    CGFloat appW=80.f;
    CGFloat appH=90.f;
    
    //appView的水平方向和垂直方向的间隔
    CGFloat marginX=(kScreenW -(totalColumn*appW))/(totalColumn+1);
    CGFloat marginY=30;
    
    for (int i=0; i<self.apps.count; i++) {
 
        // 1:创建appView视图的对象(封装一个类，发消息创建一个视图对象)
        QYAppView *appView = [QYAppView appView];
        [self.view addSubview:appView];
        
        int row = i/totalColumn;
        int column = i%totalColumn;
        
        CGFloat appX =marginX + column*(marginX+appW);
        CGFloat appY =marginY + row*(marginY+appH);
        appView.frame=CGRectMake(appX, appY, appW, appH);
        
        // 2:设置appView的数据模型
        QYApp *app=self.apps[i];  //取models (数组里放的就是数据模型)
        appView.model=app;
        
        
    }
}

//懒加载
- (NSArray *)apps
{
    if (_apps==nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *apps =[NSArray arrayWithContentsOfFile:path];
         NSMutableArray *models = [NSMutableArray array];    //可变数组用于存储可变对象
        
        for (NSDictionary *dict in apps) {    //遍历数组，数组的每一项都是字典
            QYApp *app = [QYApp appWithDict:dict];    //发消息传字典，返回给app对象
            [models addObject:app]; //完成遍历，所有的字典都变成模型了
        }
        _apps= models;       //可变数组里的对象值赋给apps
    }
    return _apps;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
