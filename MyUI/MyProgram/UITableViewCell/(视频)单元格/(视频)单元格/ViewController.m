//
//  ViewController.m
//  (视频)单元格
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

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
    
    tableView.rowHeight = 80;

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:indexPath.row %4 reuseIdentifier:identify];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        label.tag = 101;
        label.textColor = [UIColor purpleColor];
        [cell.contentView addSubview:label];
        
    }
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",(long)indexPath.row]];
    //cell的imageView是只读的(具有imageView属性)
    cell.imageView.image = image;
    
    cell.textLabel.text = _names[indexPath.row];
    
    cell.detailTextLabel.text = @"明星榜";
    
    cell.accessoryType = indexPath.row %4;
    
    UILabel *label =(UILabel *) [cell.contentView viewWithTag:101];
    label.text = @"嗨，程序员";
    
    
    return cell;
}

@end
