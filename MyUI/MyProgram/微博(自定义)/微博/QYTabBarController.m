//
//  QYTabBarController.m
//  微博
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYTabBarController.h"
#import "QYHomeViewController.h"
#import "QYMessageViewController.h"
#import "QYDisCoverViewController.h"
#import "QYMeViewController.h"

@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //绑定视图控制器
    [self bingViewController];
    
    //设置tabBar
    [self setTabBar];

}

- (void)setTabBar
{
    //设置tintcolor
    self.tabBar.tintColor = [UIColor colorWithRed:94/255.0 green:211/255.0 blue:44/255.0 alpha:1.0];
    
    //添加中间的tabBarItem (+号)
    
    CGFloat tabBarItemW = 30;
    CGFloat tabBarItemH = 30;
    CGFloat tabBarItemX = self.tabBar.center.x - tabBarItemW / 2;
    CGFloat tabBarItemY = (49 - tabBarItemH)/2;
    
    UIButton *tabbarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    tabbarItem.frame =CGRectMake(tabBarItemX, tabBarItemY, tabBarItemW, tabBarItemH);
    [self.tabBar addSubview:tabbarItem];
    
    //设置tabBarItem的背景颜色
    tabbarItem.backgroundColor = [UIColor orangeColor];
    
    //设置tabBarItem的图片
    [tabbarItem setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [tabbarItem addTarget:self action:@selector(composeAction:) forControlEvents:UIControlEventTouchUpInside ];
    
    //设置tabbarItem的圆角
    tabbarItem.layer.cornerRadius = 5;
    
}

- (void)bingViewController
{
    
    QYHomeViewController *homeVC = [[QYHomeViewController alloc] init];
    UINavigationController *first = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    QYMessageViewController *messageVC = [[QYMessageViewController alloc] init];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    QYDisCoverViewController *discoverVC = [[QYDisCoverViewController alloc] init];
    UINavigationController *third = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    QYMeViewController *meVC = [[QYMeViewController alloc] init];
    UINavigationController *fourth = [[UINavigationController alloc] initWithRootViewController:meVC];
    
    UIViewController *addVC = [[UIViewController alloc] init];
    
    NSArray *items = @[first,second,addVC,third,fourth];
    self.viewControllers = items;
    
}

//点击+号
- (void)composeAction:(UIButton *)tabbarItem
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
