//
//  ViewController.m
//  KVO2
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYView.h"
#import "QYModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet QYView *tempView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong,nonatomic) QYModel *model;
@property (nonatomic) CGFloat maxY;

@property (nonatomic,strong) NSArray *colors;

@end

@implementation ViewController

- (NSArray *)colors
{
    if (_colors ==nil) {
        _colors = @[[UIColor purpleColor],[UIColor redColor],[UIColor yellowColor],[UIColor greenColor]];
    }
    return _colors;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _model = [[QYModel alloc] init];
    
    //注册观察者观察_model的volumn的改变
    [_model addObserver:self forKeyPath:@"volumn" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(_tempView)];
    
    //tempView左下角的坐标Y
    _maxY = CGRectGetMaxY(_tempView.frame);


}
- (IBAction)swiperAction:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        if (_model.volumn <400) {
            _model.volumn +=100;
        }
    }else if (sender.direction == UISwipeGestureRecognizerDirectionDown){
        if (_model.volumn >100) {
            _model.volumn -=100;
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"血量严重不足" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}

//回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"volumn"]) {
        QYView *view = (__bridge QYView *)(context);
        
        CGRect frame = view.frame;
        frame.size.height = [change[@"new"] intValue];
        frame.origin.y = _maxY - frame.size.height;
       
        [UIView animateWithDuration:0.2 animations:^{
            view.frame = frame;
            _label.text = [@(frame.size.height) stringValue];
            view.backgroundColor = self.colors[(_model.volumn)/100 - 1];
        }];       
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
