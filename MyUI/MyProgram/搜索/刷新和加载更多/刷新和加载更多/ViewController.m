//
//  ViewController.m
//  刷新和加载更多
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    _datas =[NSMutableArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba", nil];
    
    //注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    tableView.rowHeight = 150;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [tableView addSubview:refreshControl];
    
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    
    //添加尾视图
//    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    footerBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
//    [footerBtn setTitle:@"加载更多..." forState:UIControlStateNormal];
//    footerBtn.backgroundColor = [UIColor purpleColor];
//    [footerBtn addTarget:self action:@selector(loadMoreSource) forControlEvents:UIControlEventTouchUpInside];
  //  tableView.tableFooterView = footerBtn;
    
    
}

- (void)loadMoreSource
{
    [_datas addObject:@"鹿晗"];
    [_tableView reloadData];
}


//刷新
- (void)refresh:(UIRefreshControl *)refreshControl
{
    [refreshControl performSelector:@selector(endRefreshing) withObject:nil afterDelay:5];
    
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

#pragma mark -UIScrollViewDelegate(代理方法拖动实现加载更多)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_tableView.contentOffset.y > (_tableView.contentSize.height - _tableView.frame.size.height) + 100) {
        [self loadMoreSource];
    }
}


@end
