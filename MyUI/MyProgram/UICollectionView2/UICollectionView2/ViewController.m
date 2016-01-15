//
//  ViewController.m
//  UICollectionView2
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"
#import "QYCollectionViewCell.h"
#import "QYApp.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *apps;

@end

@implementation ViewController
static NSString *itemidentifier = @"cell";
static NSString *headeridentifier = @"header";
static NSString *footeridentifier = @"footer";

//懒加载
- (NSArray *)apps
{
    if (_apps ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYApp *app = [QYApp appWithDict:dict];
            [models addObject:app];
        }
        _apps = models;
        
    }
    return _apps;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //流布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //滚动方向
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //设置item的size
    flowLayout.itemSize = CGSizeMake(90, 90);
    
    //行间距
    flowLayout.minimumLineSpacing = 10;
    //item间距
    flowLayout.minimumInteritemSpacing = 10;
    //section的缩进
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 27, 0, 28);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    
    //设置数据源和代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //注册item,头，尾视图
    [_collectionView registerNib:[UINib nibWithNibName:@"QYCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:itemidentifier];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headeridentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footeridentifier];
    
    //多选
    _collectionView.allowsMultipleSelection = YES;

}

#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.apps.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemidentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    cell.app = self.apps[indexPath.row];
    return cell;
    
}

//头尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reuseableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headeridentifier forIndexPath:indexPath];
        reuseableView.backgroundColor = [UIColor brownColor];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footeridentifier forIndexPath:indexPath];
        reuseableView.backgroundColor = [UIColor whiteColor];
    }
    return reuseableView;
}
//头尾视图的尺寸
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(30, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(10, 10);
}


#pragma mark -UICollectionDelegate
//允许显示菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//菜单中包含的操作
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return YES;
}
//处理具体的操作
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    QYCollectionViewCell *cell =(QYCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    if (action == @selector(cut:)) {
        NSLog(@"cut%@",cell.label.text);
    }
    if (action == @selector(copy:)) {
        NSLog(@"copy%@",cell.label.text);
    }
    if (action == @selector(paste:)) {
        NSLog(@"paste%@",cell.label.text);
    }
}

#if 0
#pragma mark -UICollectionViewDelegateFlowLayout
//item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}
//section整体的缩进
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 26, 0, 0);
}
//section中最小的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//section中每个item之间的间距（默认是10）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//补充视图（头大小）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(20, 10);
}
//补充视图（尾大小）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(10, 20);
}




#endif
@end
