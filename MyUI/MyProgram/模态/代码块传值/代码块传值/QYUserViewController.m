//
//  QYUserViewController.m
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYUserViewController.h"
#import "QYChangeSignViewController.h"

@interface QYUserViewController ()

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
    
    //定义一个更改个性签名(定义一个block块)
    void (^changeValue) (NSString *string) = ^(NSString *string){
        
        _descLabel.text = string;
    };
    
    //对changeSignVC视图控制器的channgeLabelValue属性赋值(把changValue代码块得到的值传给属性代码块),赋值之后才可以用
    changeSignVC.changeLabelValue = changeValue;
    
}


@end
