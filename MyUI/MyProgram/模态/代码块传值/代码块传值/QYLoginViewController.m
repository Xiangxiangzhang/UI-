//
//  ViewController.m
//  代码块传值
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYLoginViewController.h"

@interface QYLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation QYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"login"]) {
        //取目标视图器
        UIViewController *destVC = segue.destinationViewController;
        
        [destVC setValue:_username.text forKey:@"labelString"];
    }
}


@end
