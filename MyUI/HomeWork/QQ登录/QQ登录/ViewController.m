//
//  ViewController.m
//  QQ登录
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *QQname;
@property (weak, nonatomic) IBOutlet UITextField *Password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Buttonclick:(UIButton *)sender {
    
    for (int i=0; i<[_QQname.text length]; i++) {
        unichar a =[_QQname.text characterAtIndex:i];
        
        
        if (!((a >='0') && (a <='9'))) {
            
            NSLog(@"不是整形");
            NSLog(@"\nQQ_name>>>%@",_QQname.text);
            break;
        }else if (i == (_QQname.text.length-1)) {
            NSLog(@"是整形");
            NSLog(@"\nQQ_name>>>%@",_QQname.text);
        }
    }
    
    NSLog(@"\npassword>>>%@",_Password.text);
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
