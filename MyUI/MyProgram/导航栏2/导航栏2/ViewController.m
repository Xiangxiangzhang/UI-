//
//  ViewController.m
//  导航栏2
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    //更改导航栏的透明
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 80, 100, 40);
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(gotoVC2:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置导航栏
    [self setNavigationBar];
    
    //设置工具栏
    [self setToolBar];
}

//跳转至ViewController2
- (void)gotoVC2:(UIButton *)btn
{
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
    
}

//设置工具栏
- (void)setToolBar
{
    //显示工具栏
    self.navigationController.toolbarHidden = NO;
    
    //创建工具栏内容
    UIBarButtonItem *firstBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target:self action:nil];
    
    UIBarButtonItem *secondBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_pop_os7"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *thirdBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"转发" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //创建固定间隔的barBtnItem
    UIBarButtonItem *fixedSpaceBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixedSpaceBarBtnItem.width = 100;
    //创建不固定间隔barBtnItem
    UIBarButtonItem *fiexibleSpaceBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //把barBtnItem放在数组中
    NSArray *items = @[fixedSpaceBarBtnItem,firstBarBtnItem,fiexibleSpaceBarBtnItem,secondBarBtnItem,fiexibleSpaceBarBtnItem,thirdBarBtnItem,fiexibleSpaceBarBtnItem];
    //设置工具栏内容
    [self setToolbarItems:items animated:YES];
    
    
}

//设置导航栏
- (void)setNavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //修改导航栏中字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //self.navigationController.
    //设置左边的barButtonItem
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarBtnClick:)];
    self.navigationItem.leftBarButtonItem =leftBarBtnItem;
    
    //设置titleView
    NSArray *items = @[@"所有通话",@"未接来电"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    self.navigationItem.titleView = segmentControl;
    
    //设置右边的barButtonItem
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:nil];
    rightBarBtnItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    
    //设置自定义导航栏背景
    UIImage *backimage = [UIImage imageNamed:@"back.png"];
    
    [self.navigationController.navigationBar setBackgroundImage:[backimage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 50, 3, 69) resizingMode:UIImageResizingModeTile] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setHidesBarsOnTap:YES];
    
}

- (void)leftBarBtnClick:(UIBarButtonItem *)barItem
{
    NSLog(@"菜单");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
