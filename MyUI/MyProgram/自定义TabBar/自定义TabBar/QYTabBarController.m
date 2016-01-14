//
//  QYTabBarController.m
//  自定义TabBar
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYTabBarController.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
@interface QYTabBarController ()

@property (nonatomic,strong)UIView *underView;
@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置taBar
    [self setTabBar];
    
    //绑定视图控制器
    [self bindViewController];
}

- (void)bindViewController
{
    UIViewController *firstVC = [[UIViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor redColor];
    
    UIViewController *secondVC = [[UIViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor blackColor];
    
    UIViewController *thirdVC = [[UIViewController alloc] init];
    thirdVC.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *forthVC = [[UIViewController alloc] init];
    forthVC.view.backgroundColor = [UIColor brownColor];
    
    NSArray *itemVC = @[firstVC,secondVC,thirdVC,forthVC];
    self.viewControllers = itemVC;
    
}

- (void)setTabBar
{
    //背景
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, QYScreenH- 49,QYScreenW, 49)];
    [self.view addSubview:bgView];
    
    //设置可以与用户交互(会拦截点击事件，要更改视图控制器)
    bgView.userInteractionEnabled = YES;
    
    //图片
    bgView.image = [[UIImage imageNamed:@"back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 7, 6, 8) resizingMode: UIImageResizingModeStretch];
    
    //添加tabBarItem
    
    CGFloat btnW = 48;
    CGFloat btnH = 38;
    CGFloat space = 20;
    
    //计算相邻两个btn之间的距离
    CGFloat itemSpace =(QYScreenW - 2*space - 4*btnW)/3;
    for (int i =0; i<4; i++) {
        
        //计算每个btn的位置
        CGFloat btnX = space + i*(itemSpace + btnW);
        CGFloat btnY = (49 - btnH)/2;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgView addSubview:btn];
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        //设置图片
        NSString *images = [NSString stringWithFormat:@"%d",i+1];
        [btn setImage:[UIImage imageNamed:images] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        
        [btn addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    //添加tabBarItem 下面添加underView
    CGFloat underViewW = 50;
    CGFloat underViewH = 40;
    
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,underViewW,underViewH)];
    [bgView insertSubview:underView atIndex:0];
    
    //设置underView 的中心点为第一个 tabBarItem 的中心
    UIButton *firstTabBarItem = (UIButton *)[bgView viewWithTag:100];
    underView.center = firstTabBarItem.center;
    
    underView.backgroundColor = [UIColor purpleColor];
    _underView = underView;
    
    
}

- (void)changeViewController:(UIButton *)sender
{
    //更改视图控制器
    self.selectedIndex = sender.tag - 100;
    //更改underView的中心点,让underView的中心点为当前点击的视图的中心点
    _underView.center = sender.center;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
