//
//  ViewController.m
//  图片浏览器
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong,nonatomic) NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateData];
  
}

//懒加载
- (NSArray *)images
{
    if (_images==nil) {
        NSString *path= [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
        _images=[NSArray arrayWithContentsOfFile:path];
    }
    return _images;
}

- (void)updateData
{
    //1:更改indexlabel的文本
    NSString *indexdLabelText=[NSString stringWithFormat:@"%ld/%lu",index+1,(unsigned long)self.images.count];
    _indexLabel.text=indexdLabelText;
    
    //2:更改imageView的图片
    NSDictionary *dict=self.images[index];
    NSString *imageName =[dict objectForKey:@"name"];
    UIImage *image = [UIImage imageNamed:imageName];
    _imageView.image=image;
    
    //3:更改当前图片的描述
    NSString *descLableText=dict[@"desc"];
    _descLabel.text=descLableText;
    
    //4:更改左右btn的状态
    _leftBtn.enabled= index==0 ? NO:YES;
    _rightBtn.enabled= index== self.images.count-1 ? NO:YES;
    
}

- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            index--;
            [self updateData];
            break;
        case 2:
            index++;
            [self updateData];
            break;
        default:
            break;
    }
}




@end
