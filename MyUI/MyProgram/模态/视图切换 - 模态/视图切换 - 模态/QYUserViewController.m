//
//  QYUserViewController.m
//  视图切换 - 模态
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYUserViewController.h"

@interface QYUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

//属性传值
@property (nonatomic,strong) NSString *labelString;
@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //对属性进行赋值
    _label.text = [NSString stringWithFormat:@"欢迎你,%@",_labelString];
    
   

}

//注销 （隐藏个人信息页面）
- (IBAction)logout:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}



@end
