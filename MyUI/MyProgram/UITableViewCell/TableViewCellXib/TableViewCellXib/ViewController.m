//
//  ViewController.m
//  TableViewCellXib
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identfier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    _datas = @[@{@"title":@"迪丽热巴",@"subTitle":@"气质女王",@"imageName":@"icon0.jpg",@"isOn":@1},
               @{@"title":@"宋茜",@"subTitle":@"美女",@"imageName":@"icon1.jpg",@"isOn":@0},
               @{@"title":@"吴亦凡",@"subTitle":@"门面担当",@"imageName":@"icon2.jpg",@"isOn":@0},
               @{@"title":@"鹿晗",@"subTitle":@"人气偶像",@"imageName":@"icon3.jpg",@"isOn":@1},
               ];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 100;
    
    //注册单元格
    [tableView registerNib:[UINib nibWithNibName:@"QYTableViewCell" bundle:nil] forCellReuseIdentifier:identfier];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#if 0
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil][0];
    }
#else
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier forIndexPath:indexPath];
  
#endif
    
    NSDictionary *dict = _datas[indexPath.row];
    
    cell.titleLabel.text = dict[@"title"];
    cell.detailTitleLabel.text = dict[@"subTitle"];
    cell.sw.on = [dict[@"isOn"] boolValue];
    cell.imgView.image = [UIImage imageNamed:dict[@"imageName"]];
    
    return cell;
}



@end
