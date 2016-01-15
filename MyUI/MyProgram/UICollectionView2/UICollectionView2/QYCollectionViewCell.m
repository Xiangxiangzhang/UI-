//
//  QYCollectionViewCell.m
//  UICollectionView2
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYCollectionViewCell.h"
#import "QYApp.h"
@implementation QYCollectionViewCell

- (void)setApp:(QYApp *)app
{
    _app =app;
    _imgView.image = app.icon;
    _label.text = app.name;
}


- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *selectedbgView = [[UIView alloc] init];
    selectedbgView.backgroundColor = [UIColor orangeColor];
    self.selectedBackgroundView = selectedbgView;
    
}
@end
