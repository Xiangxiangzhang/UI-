//
//  SecondViewController.m
//  选择器
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong,nonatomic) NSArray *datas;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置pickerView的数据源和代理
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    _datas = [[NSArray alloc]initWithObjects:@"yiyi",@"erer",@"sansan",@"sisi",@"wuwu",@"liuliu",nil];
   
    //设置label默认文本
    _label.text = _datas.firstObject;
    
    }

#pragma mark -UIPickerDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}

#pragma mark -UIPickerViewDelegate
//设置文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _datas[row];
}

//设置属性文本
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row ==0) {
    //第一个参数：取出datas中的第一个数据，第二个参数：具体的属性(有下划线1，没有是0)，颜色
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:_datas[row] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
    
        return attributedString;
    }
    return nil;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

//选中row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:_datas[row] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
    _label.attributedText = attributedString;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
