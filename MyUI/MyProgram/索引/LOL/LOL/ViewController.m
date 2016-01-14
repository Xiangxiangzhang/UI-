//
//  ViewController.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYFriend.h"
#import "QYFriendGroup.h"
#import "QYTableViewCell.h"
#import "QYsectionHeaderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *heros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
   
}

//懒加载
- (NSArray *)heros
{
    if (_heros ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        //便利数组，字典转模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYFriendGroup *friendGroup = [QYFriendGroup friendGroupWithDictionary:dict];
            [models addObject:friendGroup];
        }
        
        _heros = models;
    }
    return _heros;
}

#pragma mark -UITableViewDataSource
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.heros.count;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QYFriendGroup *friendGroup = self.heros[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}
//单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[QYTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    QYFriendGroup *friendGroup = self.heros[indexPath.section];
    QYFriend *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    QYFriendGroup *friendGroup = self.heros[section];
//    if (friendGroup.isopen) {
//        return friendGroup.friends[section];
//    }
//    return 0;
//}
//section头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

//设置头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    QYsectionHeaderView *headerView = [QYsectionHeaderView sectionHearderViewForTableView:tableView ];
    QYFriendGroup *friendGroup = self.heros[section];
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
    };
    
    return headerView;
    
}








@end
