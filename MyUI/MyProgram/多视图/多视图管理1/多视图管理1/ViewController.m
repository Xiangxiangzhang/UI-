//
//  ViewController.m
//  多视图管理1
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic,strong) NSArray *apps;
@end

@implementation ViewController

- (NSArray *)apps
{
    if (_apps==nil) {
        NSString *path =[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps=[NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //总列数
    int totalColumn = 4;
    
    //appView的宽度和高度
    CGFloat appW=80.f;
    CGFloat appH=90.f;
    
    //appView的水平方向和垂直方向的间隔
    CGFloat marginX = (kScreenW - (appW*totalColumn)) / (totalColumn+1);
    CGFloat marginY = 30;
    
    for (int i=0; i <self.apps.count; i++) {
        // 1:创建appView的背景视图，并添加到 self.view上
        int row = i/totalColumn;
        int column = i%totalColumn;
        
        CGFloat appX = marginX + column *( appW + marginX );
        CGFloat appY = marginY + row *( appH + marginY );
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(appX, appY, appW, appH)];
        [self.view addSubview:appView];
        
        // 2:创建 icon 视图，并添加到 appView上
        CGFloat iconX =20;
        CGFloat iconY =0;
        CGFloat iconW =appW-2*iconX;
        CGFloat iconH =40;
        
        UIImageView *icon=[[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        [appView addSubview:icon];
        NSDictionary *appData = self.apps[i];
        icon.image = [UIImage imageNamed:appData[@"icon"]];
        
        // 3:创建title视图，并添加到appView上
        CGFloat titleX =0;
        CGFloat titleY =iconY+iconH;
        CGFloat titleW =appW;
        CGFloat titleH =20;
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        [appView addSubview:title];
        
        title.text=appData[@"name"];
        title.font=[UIFont systemFontOfSize:12];
        title.textAlignment = NSTextAlignmentCenter;
        
        // 4:创建下载按钮，并添加到 appView上
        CGFloat downloadBtnX =10;
        CGFloat downloadBtnY =titleY+titleH;
        CGFloat downloadBtnW =appW-2*downloadBtnX;
        CGFloat downloadBtnH =20;
        
        UIButton *downloadBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [appView addSubview:downloadBtn];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen.png"] forState:UIControlStateNormal];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted.png"] forState:UIControlStateHighlighted];
        downloadBtn.frame=CGRectMake(downloadBtnX, downloadBtnY, downloadBtnW, downloadBtnH);
        [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        downloadBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        
    
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
