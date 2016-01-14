//
//  ViewController.m
//  (视频)单元格2
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *names;
@end

static NSString *identify = @"QYCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 100;
    
    [tableView registerClass:[QYTableViewCell class] forCellReuseIdentifier:identify];
}

- (NSArray *)names
{
    if (_names ==nil) {
        _names = @[@"迪丽热巴",@"宋茜",@"吴亦凡",@"鹿晗"];
    }
    return _names;
}

#pragma mark -UITableViewData
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.textLabel.text = _names[indexPath.row];
    cell.textLabel.textColor = [UIColor purpleColor];
    //副标题
    cell.detailTextLabel.text = @"程序员";
    
    UIImage *icon = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",(long)indexPath.row]];
    cell.imageView.image = icon;
    cell.customLabel.text = @"你好";
    
    return cell;
}




@end
