//
//  ViewController.m
//  2 UITableView
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    //设置数据源
    tableView.dataSource = self;
   
}

- (NSArray *)datas
{
    if (_datas ==nil) {
        _datas = @[@"xiangxiang",@"huahua",@"youyou",@"juanjuan"];
    }
    return _datas;
    
}

#pragma mark -UITableViewDataSource
//tableView中数组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

//每组中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}


//每行具体内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ASD"];
    
#if 0
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组，第%ld行",indexPath.section,indexPath.row];
#else
    
    cell.textLabel.text = self.datas[indexPath.row];
#endif
    
    return cell;
    
}



@end
