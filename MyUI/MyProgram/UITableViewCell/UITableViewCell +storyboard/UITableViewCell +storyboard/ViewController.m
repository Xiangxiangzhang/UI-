//
//  ViewController.m
//  UITableViewCell +storyboard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"
#import "QYModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSArray *datas;

@end

static NSString *identifier = @"cell";
@implementation ViewController

- (NSArray *)datas
{
    if (_datas ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"];
        //读取数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //把数据中字典转化成模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYModel *model = [QYModel modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
        
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    QYModel *model = self.datas[indexPath.row];
    
    cell.model = model;
    
    return cell;
}



@end
