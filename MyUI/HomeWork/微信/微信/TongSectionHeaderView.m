//
//  TongSectionHeaderView.m
//  微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "TongSectionHeaderView.h"
#import "FriendGroup.h"

@interface TongSectionHeaderView ()
@property (nonatomic,strong) UIButton *bgBtn;
@property (nonatomic,strong) UILabel *label;

@end

@implementation TongSectionHeaderView
static NSString *hearderViewIdentifier = @"hearderView";

+ (instancetype)sectionHeardViewForTableView:(UITableView *)tableView
{
    TongSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:hearderViewIdentifier];
    if (headerView ==nil) {
        headerView = [[TongSectionHeaderView alloc] initWithReuseIdentifier:hearderViewIdentifier];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:hearderViewIdentifier]) {
        //添加背景btn
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:bgBtn];
        
        //背景
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *himage = [[UIImage imageNamed:@"buddy_header_bg_highlighted.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:himage forState:UIControlStateHighlighted];
        
        //设置图标
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow.png"] forState:UIControlStateNormal];
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //bgBtn 的图片视图的内容模式
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        //添加label (在线人数/总人数)
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _label = label;
        
        //添加事件监听
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _bgBtn.frame = self.bounds;
    
    CGFloat labelW =100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    
}


- (void)bgBtnClick:(UIButton *)btn
{
    _friendGroup.isopen = !_friendGroup.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
}

- (void)setFriendGroup:(FriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld",friendGroup.online,friendGroup.friends.count];
    if (_friendGroup.isopen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
    
}

@end
