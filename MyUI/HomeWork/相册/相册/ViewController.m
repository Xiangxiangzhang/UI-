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
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置内视图大小
    _scrollView.contentSize = CGSizeMake(4*400, 667);
    
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    //设置代理
    _scrollView.delegate = self;
    
    //对pagecontrol添加点击事件
    [_pagecontrol addTarget:self action:@selector(pagecontrolClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置伸缩的最大,小比例
    _scrollView.maximumZoomScale = 10.0;
    _scrollView.minimumZoomScale = 0.5;
    
    //创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
    
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
}

bool readyToZooming;
- (void)doubleClick:(UITapGestureRecognizer *)tap

{
    CGPoint point = [tap locationInView:self.view];
    
    if (readyToZooming) {
        CGRect rect = CGRectMake(point.x - (375*375/600), point.y - (375*375/600), 375, 375);
        [_scrollView zoomToRect:rect animated:YES];
       // _imageView1.transform = CGAffineTransformIdentity;
        readyToZooming = NO;
        
    }else{
        //根据point 创建矩形区域
        CGRect rect = CGRectMake(point.x - 150, point.y - 150, 300, 300);
        [_scrollView zoomToRect:rect animated:YES];
        readyToZooming = YES;
        
    }
}

//给scrollview指定要缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
    
}
- (void)pagecontrolClick
{
    //计算偏移量
    CGPoint offset = CGPointMake(_pagecontrol.currentPage * _scrollView.frame.size.width, 0);
    _scrollView.contentOffset = offset;
    
}

//减速时间结束后实现翻页
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pagecontrol.currentPage = scrollView.contentOffset.x /scrollView.frame.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
