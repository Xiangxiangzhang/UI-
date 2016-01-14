//
//  ViewController.m
//  选项卡2
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
        
        //设置当前视图控制器对应的tabBarItem
        self.tabBarItem = tabbarItem;
        
        //设置徽章
        self.tabBarItem.badgeValue = @"10";
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
   
}




@end
