//
//  AppDelegate.m
//  选项卡2
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建并设置window
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.hidden = NO;
    _window = window;
    
    //设置widow 的根视图控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    _window.rootViewController = tabBarController;
    
    //设置ViewController
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNAV = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    
    FifthViewController *fifthVC = [[FifthViewController alloc] init];
    UIImage *image = [[UIImage imageNamed:@"2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fifthVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:image tag:5];
    
    SixthViewController *sixVC = [[SixthViewController alloc] init];
    sixVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:6];
    
    NSArray *arrayVC = @[firstNAV,secondVC,thirdVC,fourthVC,fifthVC,sixVC];
    tabBarController.viewControllers = arrayVC;
    
    //设置tabbar整体的颜色
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
    //设置tabbar 上 tabbaritem的着色
    tabBarController.tabBar.tintColor = [UIColor orangeColor];
    
    //设置背景
    UIImage *imageback = [[UIImage imageNamed:@"1.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(7,7, 7, 7) resizingMode:UIImageResizingModeTile];
    [tabBarController.tabBar setBackgroundImage:imageback];
    
    //设置透明属性
    tabBarController.tabBar.translucent = NO;
    
    //设置代理(执行下面的方法)
    tabBarController.delegate = self;
   
    return YES;
}

//设置选项卡中某个选项处于不能点击状态
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == 2) {
        return NO;
    }
    return YES;
}

//设置点击后徽章为0
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.tabBarItem.badgeValue = nil;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
