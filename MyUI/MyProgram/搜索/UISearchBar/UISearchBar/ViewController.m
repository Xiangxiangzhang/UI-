//
//  ViewController.m
//  UISearchBar
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) NSDictionary *dict;
@property (strong,nonatomic) NSArray *keys;
//搜索结果
@property (strong,nonatomic) NSArray *resultArray;
@property (nonatomic) BOOL isSearching;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadDatasFromFile];
    
    
}

//加载数据
- (void)loadDatasFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *allkeys = _dict.allKeys;
    _keys = [allkeys sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isSearching) {
        return 1;
    }
    return _keys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSearching) {
        return _resultArray.count;
    }
    
    NSString *key = _keys[section];
    NSArray *array = _dict[key];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    
    if (_isSearching) {
        cell.textLabel.text = _resultArray[indexPath.row];
    }else{
    
    NSString *key = _keys[indexPath.section];
    NSArray *array = _dict[key];
    cell.textLabel.text = array[indexPath.row];
    
    }
    return cell;
    
}

//section头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (_isSearching) {
        return nil;
    }
    return _keys[section];
}

//索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (_isSearching) {
        return nil;
    }
    return _keys;
}

#pragma mark - UISearchBarDelegate
//已经开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    searchBar.showsCancelButton = YES;
}

//点击取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //隐藏取消按钮
    searchBar.showsCancelButton = NO;
    //seacherBar失去第一响应
    [searchBar resignFirstResponder];
    
    searchBar.text = nil;
    
    //更改搜索状态
    _isSearching = NO;
    [_tableView reloadData];
    
}

//点击搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //searchBar失去第一响应
    [searchBar resignFirstResponder];
    //隐藏取消按钮
    searchBar.showsCancelButton = NO;
    
    
}

//实现搜索的方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {
        _isSearching = NO;
        [_tableView reloadData];
        return;

    }
    
    _isSearching = YES;
    
    //搜索关键字
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD]%@",searchText];
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *key in _keys) {
        NSArray *array = _dict[key];
        NSArray *filteredArray = [array filteredArrayUsingPredicate:predicate];
        [result addObjectsFromArray:filteredArray];
        
    }
    _resultArray = result;
    [_tableView reloadData];
    
    
}


@end
