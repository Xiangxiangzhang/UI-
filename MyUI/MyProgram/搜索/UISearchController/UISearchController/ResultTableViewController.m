//
//  ResultTableViewController.m
//  UISearchController
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ResultTableViewController.h"

@interface ResultTableViewController ()
//搜索后的结果
@property (nonatomic,strong) NSArray *results;
@end

@implementation ResultTableViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //创建过滤谓词
    NSPredicate *priedicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD]%@",searchController.searchBar.text];
    //过滤数据
    _results = [_datas filteredArrayUsingPredicate:priedicate];
    
    [self.tableView reloadData];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = _results[indexPath.row];
    
    return cell;
    
}

@end
