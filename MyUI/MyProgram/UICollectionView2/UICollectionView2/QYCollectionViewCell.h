//
//  QYCollectionViewCell.h
//  UICollectionView2
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYApp;

@interface QYCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic,strong) QYApp *app;


@end
