//
//  ViewController.m
//  手势识别（方块）
//
//  Created by qingyun on 15/12/13.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *redImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueImageView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowImageView;

@property (strong,nonatomic) UIView *resetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//旋转
- (IBAction)rotationAction:(UIRotationGestureRecognizer *)sender
{
    UIView *view = sender.view;
    CGFloat rotation = sender.rotation;
    view.transform = CGAffineTransformRotate(view.transform, rotation);
    sender.rotation = 0;
}

//缩放（捏合）
- (IBAction)pinchAction:(UIPinchGestureRecognizer *)sender
{
    UIView *view = sender.view;
    CGFloat scale = sender.scale;
    view.transform =CGAffineTransformScale(view.transform, scale, scale);
    sender.scale = 1;
}

//移动
- (IBAction)panAction:(UIPanGestureRecognizer *)sender
{
    UIView *view = sender.view;
    CGPoint translation = [sender translationInView:self.view];
    view.center = CGPointMake(view.center.x + translation.x, view.center.y +translation.y);
    [sender setTranslation:CGPointZero inView:sender.view];
}

//长按
- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        //创建UIMenuItem对象
        UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"reset" action:@selector(resetTargetView)];
        
        //创建UIMenuController对象
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        menuController.menuItems = @[item];
        
        //item放的位置
        CGPoint location = [sender locationInView:sender.view];
        [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:sender.view];
        
        [sender.view becomeFirstResponder];
        
        //设置菜单显示
        [menuController setMenuVisible:YES animated:YES];
        
        _resetView = sender.view;
    }

}

-(void)resetTargetView{
    
    [UIView animateWithDuration:0.3 animations:^{
        _resetView.transform = CGAffineTransformIdentity;
    }];
}


//允许两个手势同时触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
