//
//  ViewController.m
//  象棋
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-10, CGRectGetHeight(self.view.frame)-10)];
    [self.view addSubview: view1];
    
    UIImageView *image1= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    image1.frame = CGRectMake(15,50,352,352);
    [self.view addSubview:image1];
    
    NSInteger x= 0 ;
    NSInteger y=0;
    for (NSInteger i=0; i<4; i++) {
        for (NSInteger j=1; j<3; j++) {
            for (NSInteger k=0; k<4; k++) {

            UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"图片.jpg"]];
            image2.frame = CGRectMake(x, y, 44, 44);
            [image1 addSubview:image2];
                
                x += 88;
        }
            x=44;
            y=y+44;
        }
        x=0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end


