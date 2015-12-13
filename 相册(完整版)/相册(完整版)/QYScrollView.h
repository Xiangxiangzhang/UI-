//
//  QYScrollView.h
//  相册(完整版)
//
//  Created by qingyun on 15/11/28.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYScrollView : UIScrollView

@property (nonatomic,strong) UIImage *img;

- (void)setImage:(UIImage *)image;

@end
