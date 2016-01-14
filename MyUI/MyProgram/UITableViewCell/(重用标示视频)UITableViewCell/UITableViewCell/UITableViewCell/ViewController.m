//
//  ViewController.m
//  UITableViewCell
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *datas;
@end
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define REGISTER
static NSString *identify = @"QYCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;

#ifdef REGISTER
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identify];
#endif
    
    
}

- (NSArray *)datas
{
    if (_datas ==nil) {
        _datas = @[@"xiangxiang",@"huahua",@"youyou",@"juanjuan"];
    }
    return _datas;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#ifdef REGISTER
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
#endif
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}



@end
