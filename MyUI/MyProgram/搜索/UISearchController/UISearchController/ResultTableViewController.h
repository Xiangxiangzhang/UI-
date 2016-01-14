//
//  ResultTableViewController.h
//  UISearchController
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController<UISearchResultsUpdating>
@property (nonatomic,strong) NSArray *datas;//将要搜索的数据

@end
