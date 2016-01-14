//
//  ViewController.m
//  (视频)自定义单元格xib
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end
static NSString *identify = @"QYCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 137;
    
    
    //[tableView registerClass:[TableViewCell class] forCellReuseIdentifier:identify];
    
    
}

- (NSArray *)datas
{
    if (_datas ==nil) {
        _datas = @[@"迪丽热巴",@"宋茜",@"吴亦凡",@"鹿晗"];
    }
    return _datas;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell ==nil) {
        
        //从bundle中加载xib
       cell = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil][0];
        
    }
    
    cell.name.text = _datas[indexPath.row];
    cell.gender.text = indexPath.row %2 ? @"女" : @"男";
    
    cell.icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",(long)indexPath.row]];
    
    
    return cell;
}




@end
