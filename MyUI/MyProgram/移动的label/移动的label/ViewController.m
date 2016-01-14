//
//  ViewController.m
//  移动的label
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define QYScreenW [UIScreen mainScreen].bounds.size.width

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *scrollLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 300, 80, 50)];
    [self.view addSubview:scrollLabel];
    scrollLabel.backgroundColor= [UIColor grayColor];
    scrollLabel.text=@"好饿啊";
    scrollLabel.font=[UIFont systemFontOfSize:14];
    scrollLabel.numberOfLines=0;
    scrollLabel.textAlignment=NSTextAlignmentCenter;
    
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat |UIViewAnimationOptionTransitionCrossDissolve animations:^{
        scrollLabel.frame=CGRectMake(QYScreenW-80, 300, 80, 50);
    }completion:^(BOOL finished){
        scrollLabel.frame=CGRectMake(0, 300, 80, 50);
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
