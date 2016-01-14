//
//  ViewController.m
//  汤姆猫终极版
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)startAnimationWithName:(NSString *)name andCount:(int)count
{
    if ([_imageView isAnimating]) {
        return;
    }
    
    NSMutableArray *images=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSString *imgNmae=[NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        
       // UIImage *image=[UIImage imageNamed:imgPath];
        NSString *path =[[NSBundle mainBundle] resourcePath];
        NSString *imgPath=[path stringByAppendingPathComponent:imgNmae];
        UIImage *image =[[UIImage alloc] initWithContentsOfFile:imgPath];
        [images addObject:image];
        
    }
    
    [_imageView setAnimationImages:images];
    [_imageView setAnimationRepeatCount:1];
    [_imageView setAnimationDuration:0.05*count];
    
    [_imageView startAnimating];
    
    //清空缓存
    [_imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:0.05*count];
}


- (IBAction)crymbal:(id)sender {
    
    [self startAnimationWithName:@"cymbal" andCount:13];
}

- (IBAction)drink:(id)sender {
    
    [self startAnimationWithName:@"drink" andCount:81];
}

- (IBAction)eat:(id)sender {
    
    [self startAnimationWithName:@"eat" andCount:40];
}

- (IBAction)fart:(id)sender {
    
    [self startAnimationWithName:@"fart" andCount:28];
}

- (IBAction)pie:(id)sender {
    
    [self startAnimationWithName:@"pie" andCount:24];
}
- (IBAction)scratch:(id)sender {
    
    [self startAnimationWithName:@"scratch" andCount:56];
    
}

@end
