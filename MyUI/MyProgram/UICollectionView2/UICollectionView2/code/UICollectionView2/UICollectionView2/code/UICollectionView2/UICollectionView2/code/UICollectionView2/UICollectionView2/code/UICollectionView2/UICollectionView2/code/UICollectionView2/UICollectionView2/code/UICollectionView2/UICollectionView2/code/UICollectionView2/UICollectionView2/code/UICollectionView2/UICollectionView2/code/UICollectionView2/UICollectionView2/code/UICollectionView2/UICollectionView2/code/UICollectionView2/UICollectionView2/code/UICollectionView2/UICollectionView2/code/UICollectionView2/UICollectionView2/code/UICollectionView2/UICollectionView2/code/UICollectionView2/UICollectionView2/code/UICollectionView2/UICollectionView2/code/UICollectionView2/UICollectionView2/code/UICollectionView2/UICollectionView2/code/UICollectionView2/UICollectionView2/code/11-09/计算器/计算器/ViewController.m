//
//  ViewController.m
//  计算器
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *leftTextfile;
@property (weak, nonatomic) IBOutlet UITextField *rightTextfile;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonclick:(UIButton *)sender {
    
    //取出两个输入框的文本
    int leftfile = [_leftTextfile.text intValue];
    int rightfile = [_rightTextfile.text intValue];
    int result = leftfile + rightfile;
    
    //@(result)装箱成string [@(result) stringValue]把串转成NSNumber
    _result.text = [@(result) stringValue];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
#if 0
    //取消两个输入框的编辑 第一响应
    [_leftTextfile resignFirstResponder];
    [_rightTextfile resignFirstResponder];
#else
    //父视图结束编辑，子视图失去第一响应
    [self.view endEditing:YES];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
