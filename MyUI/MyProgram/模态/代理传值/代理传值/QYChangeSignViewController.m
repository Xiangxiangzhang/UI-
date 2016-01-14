
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
    //代理调用协议方法 （更改labelValue）
        [self.delegate changeLabelValue:_textField.text];
        
  }];
}


@end
