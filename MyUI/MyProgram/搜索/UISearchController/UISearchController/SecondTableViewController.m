//
//  SecondTableViewController.m
//  UISearchController
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()<UISearchResultsUpdating>
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) UISearchController *searchController;

@property (nonatomic,strong) NSArray *results;

@end

@implementation SecondTableViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    //结果展现在同一个view上
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //设置更新结果的对象
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    
    //(1)searchBar 添加在导航栏上
    //self.navigationItem.titleView = _searchController.searchBar;
    //_searchController.hidesNavigationBarDuringPresentation = NO;
    
    //(2)searchBar 添加在表头视图上
    _searchController.searchBar.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    self.tableView.tableHeaderView = _searchController.searchBar;
    
}

- (void)loadDatas
{
        _datas = @[@"Here's", @"to", @"the", @"crazy", @"ones.", @"The", @"misfits.", @"The", @"rebels.", @"The", @"troublemakers.", @"The", @"round", @"pegs", @"in", @"the", @"square", @"holes.", @"The", @"ones", @"who", @"see", @"things", @"differently.", @"They're", @"not", @"fond", @"of", @"rules.", @"And", @"they", @"have", @"no", @"respect", @"for", @"the", @"status", @"quo.", @"You", @"can", @"quote", @"them,", @"disagree", @"with", @"them,", @"glorify", @"or", @"vilify", @"them.", @"About", @"the", @"only", @"thing", @"you", @"can't", @"do", @"is", @"ignore", @"them.", @"Because", @"they", @"change", @"things.", @"They", @"push", @"the", @"human", @"race", @"forward.", @"And", @"while", @"some", @"may", @"see", @"them", @"as", @"the", @"crazy", @"ones,", @"we", @"see", @"genius.", @"Because", @"the", @"people", @"who", @"are", @"crazy", @"enough", @"to", @"think", @"they", @"can", @"change", @"the", @"world,", @"are", @"the", @"ones", @"who", @"do."];
        
        _results = _datas;
    }


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _results.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
   
    cell.textLabel.text = _results[indexPath.row];
    
    return cell;
}

#pragma mark -UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if ([searchController.searchBar.text isEqualToString:@""]) {
        _results = _datas;
        [self.tableView reloadData];
        return;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD] %@",searchController.searchBar.text];
       _results = [_datas filteredArrayUsingPredicate:predicate];
       [self.tableView reloadData];
    
    
}



@end
