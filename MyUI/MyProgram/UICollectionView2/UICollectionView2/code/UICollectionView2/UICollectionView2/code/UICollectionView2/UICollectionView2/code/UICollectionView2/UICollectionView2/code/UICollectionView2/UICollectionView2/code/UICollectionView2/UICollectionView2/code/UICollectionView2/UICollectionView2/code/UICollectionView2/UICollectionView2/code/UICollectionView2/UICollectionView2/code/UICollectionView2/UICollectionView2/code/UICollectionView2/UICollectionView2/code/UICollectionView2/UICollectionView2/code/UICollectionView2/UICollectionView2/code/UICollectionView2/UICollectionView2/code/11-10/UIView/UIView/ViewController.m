//
//  ViewController.m
//  UIView
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *view0;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    
    //学习类似的函数 CGRectGetHeight (CGRect rect)
    
    _view0 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-2*50, CGRectGetHeight(self.view.frame)-2*100)];
    _view0.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_view0];
    
   // UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 10, 300, 35)];超出父视图范围检验剪切

    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, CGRectGetWidth(_view0.frame)-100, CGRectGetHeight(_view0.frame)-200)];
    view1.backgroundColor = [UIColor redColor];
    view1.alpha =0.5 ;// alpha取值范围0-1
    view1.hidden = NO;
    
    // 父子视图的确定 是由addSubview来决定的
    [_view0 addSubview:view1];
    //view1.superview = self.view; superview是只读的属性
    
    _view0.clipsToBounds = YES;// 剪裁超出父视图区域的部分
    _view0.autoresizesSubviews = YES;// 对父视图添加
    
    //TopMargin就是调整上边距，用来调整子视图
    //view1.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|tiUIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    // 调整宽度和高度
    view1.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    view1.tag = 1000;
    
    
    UIButton *big = [UIButton buttonWithType:UIButtonTypeCustom];
    [big setTitleColor:[UIColor redColor] forState:UIControlStateNormal ];
    [big setTitle:@"to big" forState:UIControlStateNormal];
    
    big.frame = CGRectMake(100, CGRectGetHeight(self.view.frame)-80, 80, 40);
    [self.view addSubview:big];
    [big addTarget:self action:@selector(toBig:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *small = [UIButton buttonWithType:UIButtonTypeCustom];
    [small setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [small setTitle:@"to small" forState:UIControlStateNormal];
    small.frame = CGRectMake(200, CGRectGetHeight(self.view.frame)-85, 100, 60);
    [self.view addSubview:small];
    [small addTarget:self action:@selector(toSmall:) forControlEvents:UIControlEventTouchDown];
    
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    image.backgroundColor = [UIColor blackColor];
    image.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:image];
    
    //    imageV.contentMode =UIViewContentModeScaleAspectFill;  //随着比例短的那一边拉伸
    //    imageV.contentMode = UIViewContentModeScaleAspectFit; //随着比例长的那一边压缩
    image.contentMode = UIViewContentModeCenter;
    image.clipsToBounds = YES;
    
    
}

- (IBAction)toSmall:(UIButton *)sender{
    _view0.frame = CGRectMake(50, 100, self.view.frame.size.width-100, CGRectGetHeight(self.view.frame)-200);
}

- (IBAction)toBig:(UIButton *)sender{
    _view0.frame = CGRectMake(50, 100, self.view.frame.size.width-50, self.view.frame.size.height-20);
    // viewwithtag可以通过 tag 来获取一个指定的子视图
    NSLog(@"view >>> %@", [_view0 viewWithTag:1000]);
}
- (IBAction)Print:(UIButton *)sender {
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(250, 300, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    //[self.view bringSubviewToFront:view2]; bringSubviewToFront接收的视图只能是自己已有的子视图
    [self.view addSubview:view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
