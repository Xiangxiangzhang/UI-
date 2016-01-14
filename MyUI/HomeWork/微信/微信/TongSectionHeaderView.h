//
//  TongSectionHeaderView.h
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroup;
@interface TongSectionHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) FriendGroup *friendGroup;
@property (nonatomic,strong) void (^headerViewClick)(void);

+ (instancetype)sectionHeardViewForTableView:(UITableView *)tableView;

@end
