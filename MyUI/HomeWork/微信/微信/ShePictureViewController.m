//
//  ShePictureViewController.m
//  微信
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ShePictureViewController.h"

@interface ShePictureViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
#define Count 3
#define SheScreenW [UIScreen mainScreen].bounds.size.width
#define SheScreenH [UIScreen mainScreen].bounds.size.height

@implementation ShePictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView.contentSize = CGSizeMake(375*3, 667);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor purpleColor];
    
    [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

//pageControl当前对应的图片
- (void)pageControlClick:(UIPageControl *)pageControl
{
    //偏移量
    CGPoint offset = CGPointMake(_pageControl.currentPage *_scrollView.frame.size.width , 0);
    _scrollView.contentOffset = offset;
    
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    
}


@end
