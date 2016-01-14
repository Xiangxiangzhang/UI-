//
//  ViewController.m
//  ActivityindicatorView
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置颜色
    _activityIndicatorView.color = [UIColor blackColor];
    
    //开始动画
    [_activityIndicatorView performSelector:@selector(startAnimating) withObject:nil afterDelay:2];
    
    //结束动画
    [_activityIndicatorView performSelector:@selector(stopAnimating) withObject:nil afterDelay:8];
    
    //动画结束之后隐藏
    _activityIndicatorView.hidesWhenStopped=YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
