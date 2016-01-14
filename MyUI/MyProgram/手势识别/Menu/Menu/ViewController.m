//
//  ViewController.m
//  Menu
//
//  Created by qingyun on 15/12/13.
//  Copyright © 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "RunMenuViewController.h"

@interface ViewController ()
@property (nonatomic,strong) RunMenuViewController *viewController;

@end

@implementation ViewController
- (void)dealloc {
    
    [_viewController.view removeFromSuperview];
    [_viewController removeFromParentViewController];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController = ({
       UICollectionViewController *viewController = [[UICollectionViewController alloc] init];
        [self.view addSubview:viewController.view];
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
        viewController;
    });

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
