//
//  ViewController.m
//  弹出视图
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate,UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -AlertView
- (IBAction)showalertView:(id)sender {
    //创建一个alertView
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请充值" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"前往",@"考虑一下", nil];
    
    //风格
    alertView.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
    //弹出alertView
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //获取用户名和密码  //可输入po userName.text 查看内容
    UITextField *userName = [alertView textFieldAtIndex:0];
    UITextField *password = [alertView textFieldAtIndex:1];
    
    switch (buttonIndex) {
        case 0:    //取消
            break;
        case 1:    //前往
            break;
        case 2:    //考虑一下
            break;
        default:
            break;
    }
}

#pragma mark -ActionSheet
- (IBAction)showactionSheet:(id)sender {
    UIActionSheet *actionsheet = [[UIActionSheet alloc]initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"前往" otherButtonTitles:@"考虑一下",@"充就充", nil];
    
    [actionsheet addButtonWithTitle:@"土豪"];
    [actionsheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}


#pragma mark -AlertController
- (IBAction)showalertController:(id)sender {
    //创建alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"充值" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        UITextField *userNamw = alertController.textFields[0];
        UITextField *password = alertController.textFields[1];
    }];
    
    //添加
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder=@"请输入用户名";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder=@"请输入密码";
        //设置密文格式
        textField.secureTextEntry=YES;
    }];
    
    //显示alertController
    [self presentViewController:alertController animated:YES completion:^{}];
    
    //UIAlertAction *action = alertController.actions[0];
    //action.enabled=NO;
    
}


@end
