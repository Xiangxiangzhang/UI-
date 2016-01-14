//
//  RunMenuViewController.h
//  Menu
//
//  Created by qingyun on 15/12/13.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunMenuViewController : UIViewController

@end
@protocol RunItemViewDelegate <NSObject>

- (void)didTapped:(NSInteger)index;

@end

@interface RunItemView : UIButton
@property (nonatomic,weak) id<RunItemViewDelegate>delegate;

- (instancetype)initWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted tag:(NSInteger)tag title:(NSString *)title;

@end

