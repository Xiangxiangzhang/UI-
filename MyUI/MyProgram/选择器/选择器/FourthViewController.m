//
//  FourthViewController.m
//  选择器
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (strong,nonatomic) NSDictionary *dict;

//左列数据
@property (nonatomic,strong) NSArray *leftDatas;
@property (nonatomic,strong) NSArray *rightDatas;

@end

@implementation FourthViewController

//懒加载
- (void)loadDataFromFile{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"statedictionary" ofType:@"plist"];
    
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    _leftDatas = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
    _rightDatas = _dict[_leftDatas.firstObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ self loadDataFromFile];
}
- (IBAction)btnClick:(UIButton *)sender {
}

#pragma mark -UIPickerViewDatasource
//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0) {
        return _leftDatas.count;
    }
    return _rightDatas.count;
}

#pragma mark -UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component ==0) {
        return _leftDatas[row];
    }
    return _rightDatas[row];
}
//选中行数
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component ==0) {
        NSString *key = _leftDatas[row];
        _rightDatas = _dict[key];
        
        //刷新右列
        [pickerView reloadComponent:1];
        //更改右列选中的行为0
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

//每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component ==0) {
        return 100;
    }
    return 200;
}

@end
