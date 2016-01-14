
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
    
    //使用block块属性之前，需要判断是否为空
    if (_changeLabelValue) {
        //调用block块，来触发QYUserViewController内部更改descLabel文本
        _changeLabelValue(_textField.text);
    }
  }];
}


@end
