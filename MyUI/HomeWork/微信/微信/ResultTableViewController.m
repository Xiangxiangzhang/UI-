//
//  ResultTableViewController.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ResultTableViewController.h"
#import "TuanModel.h"
#import "TGTableViewCellXIB.h"

@interface ResultTableViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *results;

@end

@implementation ResultTableViewController
static NSString *identifier =@"tgcell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"TGTableViewCellXIB" ofType:@"xib"];
    
    //[self.tableView registerNib:[UINib nibWithData:[NSData dataWithContentsOfFile:path] bundle:nil] forCellReuseIdentifier:identifier];
    //[self.tableView registerNib:[UINib nibWithNibName:@"TGTableViewCellXIB" bundle:nil] forCellReuseIdentifier:identifier];
   
//    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    self.tableView = tableView;
    self.tableView.rowHeight = 100;
    
}

#pragma mark -Search - Delegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if (!searchController.searchBar.text) {
        return;
    }

    NSMutableArray *array = [NSMutableArray array];
        for (TuanModel *model in _destDatas) {
            if ([model.buycount containsString:searchController.searchBar.text] || [model.title containsString:searchController.searchBar.text] || [model.price containsString:searchController.searchBar.text] ) {
                [array addObject:model];
            }
        }
        _results = array;
        [self.tableView reloadData];
}

#pragma mark - TableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TGTableViewCellXIB *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TGTableViewCellXIB" owner:self options:nil][0];
    }
    
    cell.model = _results[indexPath.row];
    return cell;
}

@end
