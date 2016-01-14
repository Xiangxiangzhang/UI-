//
//  QYStoryboardSegue.m
//  关联模态
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYStoryboardSegue.h"

@implementation QYStoryboardSegue

//重写perform方法,关联的Segue改为QYStoryboardSegue
- (void)perform
{
    if ([self.identifier isEqualToString:@"login"]) {
        //源视图控制器
        UIViewController *sourceVC = self.sourceViewController;
        //取到用户名、密码(KVC 方式获取)
        NSString *username = [sourceVC valueForKeyPath:@"username.text"];
        NSString *password = [sourceVC valueForKeyPath:@"password.text"];
        
        //用户名密码不能为空（上面已经把text取出来了）
        if ([username isEqualToString:@""] || [password isEqualToString:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名和密码不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
            return;
        
        }
        
        //服务器判断
        if (![username isEqualToString:@"12345678"] || ![password isEqualToString:@"qwertyuiop"]) {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                [sourceVC setValue:@"" forKeyPath:@"username.text"];
                [sourceVC setValue:@"" forKeyPath:@"password.text"];
            }];
            
            [alertController addAction:action];
            
            //在sourceVC中弹出alertController
            [sourceVC presentViewController:alertController animated:YES completion:nil];
            return;
        }
        
        //获取目标视图控制器
        UIViewController *destVC = self.destinationViewController;
        
        [sourceVC presentViewController:destVC animated:YES completion:^{
               [sourceVC setValue:@"" forKeyPath:@"username.text"];
            [sourceVC setValue:@"" forKeyPath:@"password.text"];
        }];
    }
}


@end
