
//
//  QYChangeSignViewController.m
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYChangeSignViewController.h"

@interface QYChangeSignViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation QYChangeSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textField.text = _descString;

}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //发送更改labelValue的通知
        //首先获取通知
        //第一个参数：将要发送的通知的名称、第二个参数：发送者、第三个参数：发送通知所带的参数
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeValue" object:nil userInfo:@{@"value":_textField.text}];
        
      }];
}


@end
