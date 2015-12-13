//
//  ViewController.m
//  相册(完整版)
//
//  Created by qingyun on 15/11/28.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation ViewController

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreebH [UIScreen mainScreen].bounds.size.height
#define Count 4
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建并添加底部的ScrollView
    [self addScrollView];
    
    //在底部的ScrollView上添加缩放的ScrollView
    [self addScrollViewForScrollView];
    
}

//添加底部滚动的scrollView
- (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,QYScreenW+25,QYScreebH)];
    [self.view addSubview:scrollView];
    
    //设置内视图的尺寸
    scrollView.contentSize = CGSizeMake((QYScreenW+25)*Count, QYScreebH);
    
    //设置分页
    scrollView.pagingEnabled = YES;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    scrollView.backgroundColor = [UIColor purpleColor];

    _scrollView= scrollView;
    
    
}

//在底部的ScrollView上添加缩放的ScrollView
- (void)addScrollViewForScrollView
{
    for (int i=0; i<Count; i++) {
        
        QYScrollView *qyscrollview = [[QYScrollView alloc] initWithFrame:CGRectMake( (QYScreenW+25)*i,0,QYScreenW,QYScreebH)];
        [_scrollView addSubview:qyscrollview];
        
        //设置zoomScrollView的imageView的image
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i+1];
        [qyscrollview setImage:[UIImage imageNamed:imageName]];
        
        //属性设置
        //qyscrollview.img = [UIImage imageNamed:imageName];
        
    }
}

//加速完成 把上个界面的ScrollView的缩放比例设置为1.0
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id object in scrollView.subviews) {
        //判断当前子视图是否为UIScrollView类型的
        if ([object isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scroll =(UIScrollView *)object;
            
            //设置还原缩放比例
            scroll.zoomScale = 1.0;
        }
    }
}

@end
