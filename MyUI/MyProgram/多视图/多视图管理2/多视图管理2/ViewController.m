//
//  ViewController.m
//  多视图管理2
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kIconTag  100
#define kTitleTag 101

@interface ViewController ()

@property (nonatomic,strong) NSArray *apps;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 总列数
    int totalColumn = 4;
    
    // appView的宽度和高度
    CGFloat appW =80.f;
    CGFloat appH =90.f;
    
    // appView的水平方向和垂直方向的间隔
    CGFloat marginX =(kScreenW-(appW*totalColumn))/(totalColumn+1);
    CGFloat marginY =30;
    
    for (int i=0; i<self.apps.count;i++) {
        
        // 1.从xib加载appView视图 V
        UIView *appView =[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil][0];
        [self.view addSubview:appView];
        
        int row = i/totalColumn;
        int column = i%totalColumn;
        
        CGFloat appX =marginX + column*(marginX+appW);
        CGFloat appY =marginY + row*(marginY+appH);
        appView.frame=CGRectMake(appX, appY, appW, appH);
        
        
        // 2.设置appView视图的数据 M
        // 2.1设置icon的图片
        //viewWithTag的默认返回类型是UIView所以要强转为UIImageView
        UIImageView *icon = (UIImageView *)[appView viewWithTag:kIconTag];
        NSDictionary *appData = self.apps[i];
        icon.image = [UIImage imageNamed:appData[@"icon"]];
        
        // 2.2设置title的文字
        UILabel *title=(UILabel *)[appView viewWithTag:kTitleTag];
        title.text=appData[@"name"];
        
    }
}

- (NSArray *)apps
{
    if (_apps==nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps=[NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

@end
