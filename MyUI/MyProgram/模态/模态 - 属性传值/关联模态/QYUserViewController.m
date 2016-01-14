//
//  QYUserViewController.m
//  关联模态
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYUserViewController.h"

@interface QYUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,strong) NSString *labelString;

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _label.text = [NSString stringWithFormat:@"欢迎,%@",_labelString];
}
- (IBAction)logout:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
