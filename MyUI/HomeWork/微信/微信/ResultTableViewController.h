//
//  ResultTableViewController.h
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController<UISearchResultsUpdating>

@property (nonatomic,strong) NSArray *destDatas;

@end
