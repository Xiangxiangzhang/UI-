//
//  ViewController.m
//  Touch
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *blueView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //判断当前点击的点是否需要处理
    //取出点击的点
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    //对需要处理的点进行操作
    if (CGRectContainsPoint(_redView.frame, location) ||CGRectContainsPoint(_blueView.frame, location) ||CGRectContainsPoint(_yellowView.frame, location)) {
        //取出触发的视图
        UIImageView *imageView =(UIImageView *) touch.view;
        imageView.center = location;
        imageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        [UIView animateWithDuration:0.5 animations:^{
            
        }];
    }else{
        if (touch.tapCount ==2) {
            [self resetFrames];
        }
    }
}
- (void)resetFrames
{
    [UIView animateWithDuration:0.5 animations:^{
        _redView.frame = CGRectMake(36, 123, 100, 100);
        _blueView.frame = CGRectMake(117, 301, 100, 100);
        _yellowView.frame = CGRectMake(233, 474, 100, 100);
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //移动的点在哪个imageView 上就把点击的点设置为 imageView的中心点
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(_redView.frame, location)) {
        _redView.center = location;
    }
    if (CGRectContainsPoint(_blueView.frame, location)) {
        _blueView.center = location;
    }
    if (CGRectContainsPoint(_yellowView.frame, location)) {
        _yellowView.center = location;
    }

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIImageView *imageView =(UIImageView *) touch.view;
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
        
    }];
}

@end
