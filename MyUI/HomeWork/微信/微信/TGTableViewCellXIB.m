//
//  TGTableViewCellXIB.m
//  微信
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TGTableViewCellXIB.h"
#import "TuanModel.h"

@implementation TGTableViewCellXIB

- (void)setModel:(TuanModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _buycountLabel.text = _model.buycount;
    _imgView.image = [UIImage imageNamed:_model.icon];
    _priceLabel.text = _model.price;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
