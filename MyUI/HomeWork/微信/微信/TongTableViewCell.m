//
//  TongTableViewCell.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TongTableViewCell.h"
#import "Friend.h"

@implementation TongTableViewCell

- (void)setFriend:(Friend *)friend
{
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.status;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
  
}


@end
