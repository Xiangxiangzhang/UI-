//
//  ViewController.m
//  3 UITableView
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end

#define QYScreenW [UIScreen mainScreen].bounds.size.width
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建并添加UITableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style: UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    //设置数据源
    tableView.dataSource = self;
    
    //设置代理
    tableView.delegate = self;
    
    //设置背景图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"bg.jpg"];
    tableView.backgroundView = imageView;
    
    //设置tableView的头视图
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,QYScreenW, 100)];
    headerLabel.text = @"TableViewHeaderView";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor orangeColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:25];
    tableView.tableHeaderView = headerLabel;
    
    //设置tableView的尾视图
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    footerLabel.text = @"SectionFooterView";
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.backgroundColor = [UIColor purpleColor];
    footerLabel.font = [UIFont boldSystemFontOfSize:20];
    tableView.tableFooterView = footerLabel;
    
    //设置行高
    tableView.rowHeight = 60;
    
    //分割线
    //样式
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //颜色
    tableView.separatorColor = [UIColor purpleColor];
    //缩进
    tableView.separatorInset =UIEdgeInsetsMake(0, 40, 0, 40);
    
    //选中
    //tableView.allowsSelection = NO;(不允许选中)
    //多选
    tableView.allowsMultipleSelection = YES;
    
}

//懒加载
- (NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"xiangxiang",@"huahua",@"youyou",@"juanjuan"];
    }
    return _datas;
}

#pragma mark -UITableViewDataSource
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

//组中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

//每行中的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"a"];
    cell.textLabel.text = self.datas[indexPath.row];
    
    return cell;
}

//设置头标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
//}
//
////设置尾标题
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"SectionFooterView:%ld",section];
//}

#pragma mark -UITableViewDelegate
//设置section的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionheaderLabel = [[UILabel alloc] init];
    sectionheaderLabel.text = [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
    sectionheaderLabel.textAlignment = NSTextAlignmentCenter;
    return sectionheaderLabel;
}
//设置section的尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionfooterLabel = [[UILabel alloc] init];
    sectionfooterLabel.text = [NSString stringWithFormat:@"SectionFooterView:%ld",section];
    sectionfooterLabel.textAlignment = NSTextAlignmentCenter;
    return sectionfooterLabel;
}

//设置section的头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
//设置section的尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

//奇数行70 偶数行50
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 ==0) {
        return 50;
    }
    return 70;
    
}

//Selection
//允许高亮显示选中
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//已经高亮显示
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
}
//已经取消高亮显示
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//将要选中
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
//将要取消选中
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

// Called after the user changes the selection.
//已经选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取点击的单元格
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blueColor];
    //给选中的行添加辅助视图
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}
//已经取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
}

//设置辅助视图的样式
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDetailButton;
}
//点击辅助视图
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
}


@end




