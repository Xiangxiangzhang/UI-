//
//  ViewController.m
//  UIPageControl
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPageControl *pagecontrol = [[UIPageControl alloc] initWithFrame:CGRectMake(30, 100, 300, 100)];
    [self.view addSubview:pagecontrol];
    
    //设置背景颜色
    pagecontrol.backgroundColor = [UIColor grayColor];
    //设置总页码
    pagecontrol.numberOfPages = 6;
    //当前页
    pagecontrol.currentPage = 3;
    
    //着色
    pagecontrol.pageIndicatorTintColor = [UIColor blackColor];
    //当前页着色
    pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];

    //设置延迟显示页码
    pagecontrol.defersCurrentPageDisplay = YES;
    [pagecontrol addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
  
}

-(void)pageControlClick:(UIPageControl *)pageControl
{
    [pageControl performSelector:@selector(updateCurrentPageDisplay) withObject:nil afterDelay:2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
