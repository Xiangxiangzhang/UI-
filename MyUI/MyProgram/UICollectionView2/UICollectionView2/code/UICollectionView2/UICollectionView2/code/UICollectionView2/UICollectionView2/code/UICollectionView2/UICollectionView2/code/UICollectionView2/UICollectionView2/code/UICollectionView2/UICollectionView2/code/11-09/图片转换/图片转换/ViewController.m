//
//  ViewController.m
//  图片转换
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置高亮状态下的背景
    [_headerButton setBackgroundImage:[UIImage imageNamed:@"dog2"] forState:UIControlStateHighlighted];
    //设置高亮状态下的标题
    [_headerButton setTitle:@"大黑狗" forState:UIControlStateHighlighted];
    
    //设置高亮状态下的标题颜色
    [_headerButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //为Button添加事件监听
    [_headerButton addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchDragExit];
    
    
    //创建新Button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    //把btn添加在view上
    [self.view addSubview:btn];
    //设置frame
    btn.frame = CGRectMake(10, 30, 100, 100);
    //设置btn的背景颜色
    btn.backgroundColor = [UIColor blueColor];
    //添加标题
    [btn setTitle:@"hello,world" forState:UIControlStateNormal];
    //设置标题偏移
    btn.titleEdgeInsets = UIEdgeInsetsMake(30, 8, 0, 0);
    
    
     //Do any additional setup after loading the view, typically from a nib.
}

-(void)headerBtnClick:(UIButton *)button
{

}

//旋转
- (IBAction)rotate:(UIButton *)sender
{
    
    // frame,bounds,center,transform,backgroundcolor,hidden
    // CGAffineTransformRotate用来旋转控件， 第二个参数是 角度
    // 以半径单位为1的圆为例，整个圆周弧长为 2π，所以2π就代表360度，π就代表180度，其他数值一次类推，系统定义了很多这样的宏：如 M_PI_2 就是90°
    
    [UIView animateWithDuration:2 animations:^{
        if (sender.tag==7) {
            _headerButton.transform = CGAffineTransformRotate(_headerButton.transform, M_PI_2); // 逆时针旋转90°
        }else{
            _headerButton.transform = CGAffineTransformRotate(_headerButton.transform,-M_PI_2); // 顺时针旋转90°
        }
    }]; 
    
    
}

- (IBAction)moveButton:(UIButton *)sender {
    
    //头尾式
    [UIView beginAnimations:nil context:nil];
    //设置时间间隔
    [UIView setAnimationDuration:3];
    //设置速度方式
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    float delta = 15;
    CGPoint center = _headerButton.center;
    switch (sender.tag) {
        case 1://向上
        {
            center.y -=delta;
        }
            break;
        case 2://向左
        {
            center.x -=delta;
        }
            break;
        case 3://向下
        {
            center.y +=delta;
        }
            break;
        case 4://向右
        {
            center.x +=delta;
        }
            break;
           
        default:
            break;
    }
    _headerButton.center = center;
    //提交动画（本程序中可以不提交，但是以后涉及到项目问题，如果不提交就会影响整体动画效果）
    [UIView commitAnimations];
}
- (IBAction)scale:(UIButton *)sender {
    
    //block方式动画
    [UIView animateWithDuration:4 animations:^{
        
#if 0
        CGFloat delta = 20;
        CGRect frame = _headerButton.frame;
        if (sender.tag == 5) {//缩小
            frame.size.width -=delta;
            frame.size.height -=delta;
        }else if (sender.tag == 6){//放大
            frame.size.width +=delta;
            frame.size.height +=delta;
        }
        _headerButton.frame = frame;
#else
        if (sender.tag == 6) {//放大
            //transform 标示的是该控件的矩阵，通过CGAffineTransformxxxxx函数可以操作控件的矩阵
            _headerButton.transform = CGAffineTransformScale(_headerButton.transform, 1.5, 1.5);
        }else if (sender.tag == 5){//缩小
            _headerButton.transform = CGAffineTransformScale(_headerButton.transform, 0.5, 0.5);
        }
#endif
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
