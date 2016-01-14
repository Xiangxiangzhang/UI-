//
//  ViewController.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TuanViewController.h"
#import "TGTableViewCellXIB.h"
#import "TuanModel.h"
#import "ResultTableViewController.h"

@interface TuanViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *BianjiBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SearchBtn;
@property (strong,nonatomic) NSMutableArray *datas;

@property (strong,nonatomic) UISearchController *searchController;

@end

@implementation TuanViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:@"团购" image:[UIImage imageNamed:@"tabbar_mainframe.png"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL.png"]];
    
    self.tabBarItem = tabbarItem;
    
    _scrollView.contentSize = CGSizeMake(3 * 375, 130);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    [_pageController addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addTableView];
   
    [self createSeach];
    
}

#pragma mark -XIB -TableView
- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 190, 375, 667) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    
    _tableView = tableView;
    
}

//搜索
- (void)createSeach
{
    ResultTableViewController *resuleVC = [[ResultTableViewController alloc] init];
    resuleVC.destDatas = self.datas;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resuleVC];
    
    _searchController.searchResultsUpdater = resuleVC;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = YES;

}

- (NSArray *)datas
{
    if (_datas ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        //字典转模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            TuanModel *model = [TuanModel tuanModelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
        
    }
    return _datas;
}

- (IBAction)searchClick:(UIBarButtonItem *)sender
{
    [self presentViewController:_searchController animated:YES completion:nil];

}

#pragma mark -UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     TGTableViewCellXIB *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TGTableViewCellXIB" owner:self options:nil][0];
    }
    
    TuanModel *model = _datas[indexPath.row];
#if 0
    cell.titleLabel.text = model.title;
    cell.detailTitleLabel.text = model.price;
    cell.otherTitleLabel.text = model.buycount;
    cell.imageView.image = [UIImage imageNamed:model.icon];
#else
    cell.model = model;
#endif
    return cell;
}

//取pageControl当前对应的图片
- (void)pageControlClick:(UIPageControl *)pageControl
{
    CGPoint offset = CGPointMake(_pageController.currentPage * _scrollView.frame.size.width, 0);
    _scrollView.contentOffset = offset;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    _pageController.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

@end
