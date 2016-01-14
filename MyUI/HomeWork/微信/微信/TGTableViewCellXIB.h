//
//  TGTableViewCellXIB.h
//  微信
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TuanModel;

@interface TGTableViewCellXIB : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buycountLabel;


@property (nonatomic, strong) TuanModel *model;

@end
