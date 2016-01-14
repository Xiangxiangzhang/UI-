//
//  FirstTableViewController.m
//  UISearchController
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ResultTableViewController.h"
@interface FirstTableViewController ()
//展示数据
@property (nonatomic,strong) NSArray *datas;
//搜索控制器
@property (nonatomic ,strong) UISearchController *searchController;

@end

@implementation FirstTableViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    
    //注册单元格
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    //创建结果视图控制器
    ResultTableViewController *resuleVC = [[ResultTableViewController alloc] init];
    //设置结果视图控制器中要搜索的数据
    resuleVC.datas = _datas;
    //设置搜索控制器
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resuleVC];
    //设置代理
    _searchController.searchResultsUpdater = resuleVC;
    //设置蒙版
    _searchController.dimsBackgroundDuringPresentation = YES;
    //设置导航栏隐藏
    _searchController.hidesNavigationBarDuringPresentation = YES;
 
}

//加载数据
- (void)loadDatas
{
    _datas = @[@"Here's", @"to", @"the", @"crazy", @"ones.", @"The", @"misfits.", @"The", @"rebels.", @"The", @"troublemakers.", @"The", @"round", @"pegs", @"in", @"the", @"square", @"holes.", @"The", @"ones", @"who", @"see", @"things", @"differently.", @"They're", @"not", @"fond", @"of", @"rules.", @"And", @"they", @"have", @"no", @"respect", @"for", @"the", @"status", @"quo.", @"You", @"can", @"quote", @"them,", @"disagree", @"with", @"them,", @"glorify", @"or", @"vilify", @"them.", @"About", @"the", @"only", @"thing", @"you", @"can't", @"do", @"is", @"ignore", @"them.", @"Because", @"they", @"change", @"things.", @"They", @"push", @"the", @"human", @"race", @"forward.", @"And", @"while", @"some", @"may", @"see", @"them", @"as", @"the", @"crazy", @"ones,", @"we", @"see", @"genius.", @"Because", @"the", @"people", @"who", @"are", @"crazy", @"enough", @"to", @"think", @"they", @"can", @"change", @"the", @"world,", @"are", @"the", @"ones", @"who", @"do."];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

//弹出搜索结果
- (IBAction)searchItemClick:(UIBarButtonItem *)sender
{
    [self presentViewController:_searchController animated:YES completion:nil];
}

@end
