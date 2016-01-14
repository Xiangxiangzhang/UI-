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
    
    //首先获取通知中心，然后添加通知监听
    //第一个参数：当前的通知的接受者、第二个参数：接受通知触发的方法、第三个参数：当前通知的名称、第四个参数：通知发送着，一般设置为nil(接受任意发送者的通知)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabelValue:) name:@"changeValue" object:nil];
    
}

- (void)changeLabelValue:(NSNotification *)notification{
    _descLabel.text = notification.userInfo[@"value"];
}

- (IBAction)logout:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
      
        //注销之后，移除通知
        //首先获取通知中心
        //第一个参数：通知的接受者、第二个参数：通知的名称、第三个参数：通知的发送者
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeValue" object:nil];
        
    }];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //获取目标视图控制器（QYChangeSignViewController）
    QYChangeSignViewController *changeSignVC = segue.destinationViewController;
    //传递现有的个性签名
    changeSignVC.descString = _descLabel.text;
    
}




@end
