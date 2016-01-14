//
//  TongViewController.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TongViewController.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "TongTableViewCell.h"
#import "TongSectionHeaderView.h"

@interface TongViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *qqfriend;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic) BOOL isSearching;
@property (nonatomic,strong) NSArray *resultArray;

@end
#define TongScreenW [UIScreen mainScreen].bounds.size.width
#define TongScreenH [UIScreen mainScreen].bounds.size.height
@implementation TongViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60,TongScreenW , TongScreenH) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    _tableView = tableView;
    
    //编辑按钮
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    
    //搜索
    [self addSearchBar];
    _tableView.tableHeaderView = _searchBar;
    
}

- (NSArray *)qqfriend
{
    if (_qqfriend ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            FriendGroup *friendGroup = [FriendGroup friendGroupWithDictionary:dict];
            [models addObject:friendGroup];
        }
        _qqfriend = models;
        
    }
    return _qqfriend;
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isSearching) {
        return 1;
    }
    return self.qqfriend.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSearching) {
        return _resultArray.count;
    }
    
    FriendGroup *friendGroup = self.qqfriend[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    TongTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[TongTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    FriendGroup *friendGroup = self.qqfriend[indexPath.section];
    if (_isSearching) {
        Friend *friend = _resultArray[indexPath.row];
        cell.friend = friend;
    }else{
    
        Friend *friend = friendGroup.friends[indexPath.row];
        cell.friend = friend;
    }
    return cell;
}

//section 的高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

//设置头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TongSectionHeaderView *headerView = [TongSectionHeaderView sectionHeardViewForTableView:tableView];
    FriendGroup *friendGroup = self.qqfriend[section];
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
        
    };
    
    return headerView;
    
}

#pragma mark -编辑单元格 -Delete
- (void)editAction:(UIBarButtonItem *)item
{
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"完成";
        [_tableView setEditing:YES animated:YES];
    }else{
        item.title = @"编辑";
        [_tableView setEditing:YES animated:YES];
    }
}

//添加删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action,NSIndexPath *indexPath){
        
        NSMutableDictionary *Dict = _qqfriend[indexPath.section];
        NSMutableArray *Array = [Dict valueForKeyPath:@"friends"];
        [Array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
       
    }];
    return @[rowAction];
}

#pragma mark -move
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSMutableDictionary *sourceDict = _qqfriend[sourceIndexPath.section];
    NSMutableDictionary *destinationDict = _qqfriend[destinationIndexPath.section];
    NSMutableArray *sourceArray = [sourceDict valueForKeyPath:@"friends"];
    NSMutableArray *destinationArray = [destinationDict valueForKeyPath:@"friends"];
    FriendGroup *friend = [sourceArray objectAtIndex:sourceIndexPath.row];
    [sourceArray removeObjectAtIndex:sourceIndexPath.row];
    [destinationArray insertObject:friend atIndex:destinationIndexPath.row];
   
}

#pragma mark -Search
- (void)addSearchBar
{
    UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 60, 375, 40)];
    searchbar.delegate = self;
    _searchBar = searchbar;
    
}
//编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
//点击取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    
    [searchBar resignFirstResponder];
    
    searchBar.text = nil;
    
    //更改搜索状态
    _isSearching = NO;
    [_tableView reloadData];
    
}
//点击搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {
        _isSearching = NO;
        [_tableView reloadData];
        return;
    }
    
    _isSearching = YES;
    
    NSMutableArray *results = [NSMutableArray array];
    for (FriendGroup *friendGroup in _qqfriend) {
        NSArray *array = [friendGroup valueForKeyPath:@"friends"];
        for (Friend *friend in array) {
            if ([friend.name containsString:searchText] || [friend.status containsString:searchText]) {
            [results addObject:friend];
        }
      }
    }
    _resultArray = results;
    [_tableView reloadData];
}

@end

