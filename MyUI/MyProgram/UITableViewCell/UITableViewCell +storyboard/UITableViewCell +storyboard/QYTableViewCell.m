//
//  QYTableViewCell.m
//  UITableViewCell +storyboard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYTableViewCell.h"
#import "QYModel.h"
@implementation QYTableViewCell

//重写set方法
- (void)setModel:(QYModel *)model
{
    //自己完成的
    _model = model;
    
    //额外的
    _titleLabel.text = model.name;
    _detailTitleLabel.text = model.sex;
    _sw.on = model.ison;
    _imgView.image = [UIImage imageNamed:model.icon];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
