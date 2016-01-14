//
//  ViewController.m
//  汤姆猫
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic ,strong)UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"eat_00.jpg"]];
    _image.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_image];
    
    UIButton *buteat = [UIButton buttonWithType:UIButtonTypeSystem];
    buteat.frame=CGRectMake(30, 400, 50, 50);
    [buteat setBackgroundImage:[UIImage imageNamed:@"eat.png"] forState:UIControlStateNormal];
    [self.view addSubview:buteat];
    [buteat addTarget:self action:@selector(eat:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *butscratch = [UIButton buttonWithType:UIButtonTypeSystem];
    butscratch.frame=CGRectMake(300, 400, 50, 50);
    [butscratch setBackgroundImage:[UIImage imageNamed:@"scratch.png"] forState:UIControlStateNormal];
    [self.view addSubview:butscratch];
    [butscratch addTarget:self action:@selector(scratch:) forControlEvents:UIControlEventTouchDown];
    
    
    
    UIButton *butleft = [UIButton buttonWithType:UIButtonTypeSystem];
    butleft.frame=CGRectMake(190, 600, 50, 50);
    [self.view addSubview:butleft];
    [butleft addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *butright =[UIButton buttonWithType:UIButtonTypeSystem];
    butright.frame=CGRectMake(130, 600, 50, 50);
    [self.view addSubview:butright];
    [butright addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchDown];
    
    
}

- (IBAction)eat:(id)sender{
    
    NSMutableArray *arry = [NSMutableArray array];
    for (int i=0; i<40; i++) {
        [arry addObject:[UIImage imageNamed:[NSString stringWithFormat:@"eat_%02d.jpg",i]]];
    }
    
    //设置动画数组
    [self.image setAnimationImages:arry];
    //设置动画次数
    [self.image setAnimationRepeatCount:1];
    //设置动画时间
    [self.image setAnimationDuration:40*0.08];
    //开始动画
    [self.image startAnimating];
}

- (IBAction)scratch:(id)sender{
    
    NSMutableArray *arr1 = [NSMutableArray array];
    for (int i=0; i<56; i++) {
        [arr1 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"scratch_%02d.jpg",i]]];
    }
    
    [self.image setAnimationImages:arr1];
    [self.image setAnimationRepeatCount:1];
    [self.image setAnimationDuration:56*0.08];
    [self.image startAnimating];
}

- (IBAction)left:(id)sender{
    
    if(self.image.isAnimating){
        return;
    }
    
    NSMutableArray *arr2=[NSMutableArray array];
    for (int i=0; i<30; i++) {
        [arr2 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"footLeft_%02d.jpg",i]]];
    }
    
    [self.image setAnimationImages:arr2];
    [self.image setAnimationRepeatCount:1];
    [self.image setAnimationDuration:30*0.08];
    [self.image startAnimating];
    
}

- (IBAction)right:(id)sender{
    
    NSMutableArray *arr3=[NSMutableArray array];
    for (int i=0; i<30; i++) {
        [arr3 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"footRight_%02d.jpg",i]]];
    }
    
    [self.image setAnimationImages:arr3];
    [self.image setAnimationRepeatCount:1];
    [self.image setAnimationDuration:30*0.08];
    [self.image startAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
