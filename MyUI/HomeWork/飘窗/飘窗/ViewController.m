//
//  ViewController.m
//  飘窗
//
//  Created by qingyun on 15/11/11.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)IBOutlet UIButton *but1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 750, 1334)];
    [self.view addSubview:view1];
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景图.jpg"]];
    image1.frame = CGRectMake(0, 0, 750, 1334);
    [view1 addSubview:image1];
   
    _but1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 80, 80)];
    [image1 addSubview:_but1];
    
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.gif"]];
    image2.alpha=0.7;
    [_but1 addSubview:image2];
    
    [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(start) userInfo:nil repeats:YES];
    
}

- (void)start{
    
    static int x=5;
    static int y=5;
    
    [UIView animateWithDuration:0.1 animations:^{
        CGPoint center = _but1.center;
        
        center.x +=x;
        center.y +=y;
        
        _but1.center=center;
        
    }];
    
    if ((_but1.center.x+40) >= (self.view.frame.size.width) || (_but1.center.x <=40)) {
        x =-x;
    }
    if ((_but1.center.y+40) >= (self.view.frame.size.height) || (_but1.center.y <=40)) {
        y =-y;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
