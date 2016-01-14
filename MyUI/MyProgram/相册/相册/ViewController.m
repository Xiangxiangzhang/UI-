//
//  ViewController.m
//  相册
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置内视图大小
    _scrollView.contentSize = CGSizeMake(3*375, 667);
    
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    //设置代理
    _scrollView.delegate = self;
    
    //对pageControl添加点击事件
    [_pageControl addTarget:self action:@selector(pagecontrollerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


//更改scrollview的偏移量，显示pageControl当前页对应的图片
- (void)pagecontrollerClick:(UIPageControl *)pageControl
{
    //计算偏移量
    CGPoint offset = CGPointMake(pageControl.currentPage * _scrollView.frame.size.width, 0);
    _scrollView.contentOffset = offset;
    
}

#pragma mark -UIScrollviewDelegate
//减速事件结束后切换页面
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}


@end
