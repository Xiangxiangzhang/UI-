//
//  ViewController.m
//  视图切换 - 模态
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYLoginViewController.h"
#import "QYUserViewController.h"

@interface QYLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation QYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//登录
- (IBAction)login:(UIButton *)sender {
    //本地判断用户名和密码是否为空
    if ([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名和密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    //服务器判断是否合法
    if ([_username.text isEqualToString:@"12345678"] && [_password.text isEqualToString:@"qazwsx"]) {
        
        //登录
        //获取关联的storyboard
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //在storyboard中初始化对象,方法指的是：根据storyboard中唯一的标示(去设置stioyboard)来初始化一个视图控制器
        QYUserViewController *userViewController = [storyBoard instantiateViewControllerWithIdentifier:@"uservc"];
        
        //1.对userViewController中的属性进行 KVC 方式传值 （新增加的属性写在.m中）
        [userViewController setValue:_username.text forKey:@"labelString"];
        //2.直接传值 (新增属性写在 .h 中)
        //userViewController.labelString = _username.text;
        
        //设置模态动画效果
        userViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        
        //点登录后清除用户名和密码,弹出个人信息界面
        [self presentViewController:userViewController animated:YES completion:^{
            _username.text=@"";
            _password.text=@"";
        }];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名或密码不正确" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alertView show];
        
    }
    
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
