//
//  ViewController.m
//  UICollectionView
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController
static NSString *itemidentifier = @"item";
static NSString *headerIdentifier = @"header";
static NSString *footerIdentifier = @"footer";

- (void)viewDidLoad {
    [super viewDidLoad];
      //流布局
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    //滚动的方向
    [flowLayOut setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //设置item的size
    flowLayOut.itemSize = CGSizeMake(60, 60);
    
    //行间距
    flowLayOut.minimumLineSpacing = 10;
    //item之间的间距
    flowLayOut.minimumInteritemSpacing = 10;
    
    //section的缩进
    flowLayOut.sectionInset = UIEdgeInsetsMake(0, 27, 0, 28);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame collectionViewLayout:flowLayOut];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor blackColor];
    
    //设置数据源和代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //注册item
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:itemidentifier];
    
    //注册补充视图头和尾
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
    
    
}

#pragma mark -UICollerctionViewDataSource
//collectionView 的section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
//section中的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
//item内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemidentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}
//补充视图（头尾）
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reuseableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        reuseableView.backgroundColor = [UIColor grayColor];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
        reuseableView.backgroundColor = [UIColor whiteColor];
    }
    return reuseableView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(10, 20);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(10, 20);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
