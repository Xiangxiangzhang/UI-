//
//  QYScrollView.m
//  相册(完整版)
//
//  Created by qingyun on 15/11/28.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYScrollView.h"

@interface QYScrollView ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *imagesView;
@end

@implementation QYScrollView

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加缩放视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imagesView = imageView;
        
        //设置自身属性
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 0.5;
        self.delegate = self;
        
        //添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        
        //设置有效点击次数
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}

//双击缩放
- (void)doubleClick:(UITapGestureRecognizer *)tap
{
    //当前的缩放比例不等于1.0
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    
    //当前的缩放比例为1.0的时候，放大一个指定区域
    CGPoint location = [tap locationInView:self];
    
    CGRect rect = CGRectMake(location.x - 100, location.y - 100, 200, 200);
    
    [self zoomToRect:rect animated:YES];
    
}

//属性设置imageView的image
//- (void)setImg:(UIImage *)img
//{
//    _imagesView.image = img;
//}

//方法设置imageView的image
- (void)setImage:(UIImage *)image
{
    _imagesView.image = image;
}

#pragma mark -UIScrollViewDelegate
//一定要实现的方法(指定要缩放的视图)
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imagesView;
    
}





@end
