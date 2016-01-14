//
//  ViewController.m
//  编辑表视图
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSArray *keys;
@end

@implementation ViewController

static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadDictForFile];
    
    //注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;

}

- (void)editAction:(UIBarButtonItem *)item
{
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"完成";
        //处于编辑状态
        [_tableView setEditing:YES animated:YES];
    }else{
        item.title = @"编辑";
        [_tableView setEditing:YES animated:YES];
    }
    
}

- (void)loadDictForFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    //取出所有的key
    NSArray *array =_dict.allKeys;
    _keys = [array sortedArrayUsingSelector:@selector(compare:)];
    
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}
//组中单元格数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //从section中取出对应的key
    NSString *key = _keys[section];
    NSArray *array = _dict[key];
    return array.count;
}
//单元格中数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    //取到当前section对应的索引
    NSString *key = _keys[indexPath.section];
    //取到当前section的行数据
    NSArray *array = _dict[key];
    //当前单元格对应的数据
    cell.textLabel.text = array[indexPath.row];
    return cell;
   
}

//设置section的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}

//索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

//编辑添加删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//设置当前单元格的编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 ==0) {
        return UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleInsert;
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出数据
    NSString *key = _keys[indexPath.section];
    NSMutableArray *array = _dict[key];
    
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        //更改数据源
        [array insertObject:@"鹿晗" atIndex:indexPath.row + 1];
        
        //更改界面
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        
        [tableView insertRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationRight];
       
    }else if (editingStyle == UITableViewCellEditingStyleDelete){
        
        //更改数据源
        [array removeObjectAtIndex:indexPath.row];
        
        //更改界面
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
}

#pragma mark 编辑--移动
- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    //取出源单元格对应的数据
    //取出section对应的sourceKey(原始的key)
    NSString *sourceKey = _keys[sourceIndexPath.section];
    //用sourceKey取section的所有数据sourceArray
    NSMutableArray *sourceArray = _dict[sourceKey];
    //从sourceArray中取到当前移动的单元格的内容
    NSString *sourceString = sourceArray[sourceIndexPath.row];
    //把移动的单元格内容移除
    [sourceArray removeObjectAtIndex:sourceIndexPath.row];
    
    
    //把取到的源单元格的数据插入到目的indexPath
    //取到插入的数据（目标section的数据）
    //目标section的destKey
    NSString *destKey = _keys[destinationIndexPath.section];
    //用destKey取目标section的数据
    NSMutableArray *destArray = _dict[destKey];
    
    //插入移动的单元格数据
    [destArray insertObject:sourceString atIndex:destinationIndexPath.row];
    
}

#pragma mark --扩展
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *rowAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"分享" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"微信" otherButtonTitles:@"QQ",@"微博", nil];
        [actionSheet showInView:self.view];
    }];
    rowAction1.backgroundColor = [UIColor grayColor];
    
    UITableViewRowAction *rowAction2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSString *key = _keys[indexPath.section];
        NSMutableArray *array = _dict[key];
        [array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    rowAction2.backgroundColor = [UIColor purpleColor];
    
    return @[rowAction1,rowAction2];
}


@end
