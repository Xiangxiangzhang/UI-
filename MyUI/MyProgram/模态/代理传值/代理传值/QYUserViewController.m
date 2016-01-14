//
//  QYUserViewController.m
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYUserViewController.h"
#import "QYChangeSignViewController.h"
#import "QYChangeLabelValue.h"

@interface QYUserViewController ()<QYChangeLabelValue>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (strong ,nonatomic) NSString *labelString;

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text = [NSString stringWithFormat:@"欢迎你，%@",_labelString];
    
}

- (IBAction)logout:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //获取目标视图控制器（QYChangeSignViewController）
    QYChangeSignViewController *changeSignVC = segue.destinationViewController;
    //传递现有的个性签名
    changeSignVC.descString = _descLabel.text;
    
    //设置代理
    changeSignVC.delegate = self;
}

#pragma mark -QYChangeLabelValue
//调用协议里的方法，获取新的个性签名
- (void)changeLabelValue:(NSString *)value
{
    _descLabel.text = value;
}


@end
