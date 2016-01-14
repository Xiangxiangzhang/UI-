//
//  QYTableViewCell.m
//  (视频)单元格2
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYTableViewCell.h"

@implementation QYTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        _customLabel = [[UILabel alloc] init];
        _customLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 100, 30)];
        _customLabel.textColor = [UIColor purpleColor];
        
        [self.contentView addSubview:_customLabel];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect iconFrame = self.imageView.frame;
    iconFrame.origin.x += 240;
    self.imageView.frame = iconFrame;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
