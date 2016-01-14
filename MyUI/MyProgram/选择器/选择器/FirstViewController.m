//
//  ViewController.m
//  选择器
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置范围
    //设置最小的时间
    //创建时间的组成部分
    NSDateComponents *components = [[NSDateComponents alloc] init];
    //设置日期
    components.year = 2015;
    components.month = 11;
    components.day = 21;
    
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //显示的日期
    NSDate *mindate = [calendar dateFromComponents:components];
    
    //日期的最小范围
    _datePicker.minimumDate = mindate;
    
    //设置最大时间（显示到当前时间后10天时间）
    NSDate *maxdate = [[NSDate alloc] initWithTimeIntervalSinceNow:10*24*60*60];
    _datePicker.maximumDate = maxdate;
    
    //把世界时间转化成当前时区的时间
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
#if 0
    NSInteger intral = [timeZone secondsFromGMTForDate:_datePicker.date];
    NSDate *localDate = [_datePicker.date dateByAddingTimeInterval:intral];
#else
    NSString *dateString = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    
#endif
    
    }

- (IBAction)selected:(UIButton *)sender {
    
    //当前时间
    NSString *selectedDate = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"当前时间为" message:selectedDate preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
