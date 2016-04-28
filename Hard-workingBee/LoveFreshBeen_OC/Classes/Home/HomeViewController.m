//
//  HomeViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/1.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeadView.h"
#import "HomeCell.h"
#import "Goods.h"
#import "HomeHeadData.h"
#import "Activity.h"
#import "HomeHeaderCell.h"
#import "HomeCategoryCell.h"
#import "LFBRefreshHeader.h"
#import "WebViewController.h"


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) HomeHeadView *headView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray<Goods *> *freshHots;
@property (nonatomic,strong) HomeHeadData *homeHeadData;
@property (nonatomic,assign) CGFloat homeTableHead;
@property (nonatomic,strong) HomeHeadView *homeHeadView;
@end

/** cell identifier */
static NSString *homeCellId = @"homeCellId";
static NSString *homeCategoryCellId = @"homeCategoryCellId";
static NSString *footerCellId = @"footerCellId";
static NSString *headerCellId = @"headerCellId";


@implementation HomeViewController

#pragma life cycle method
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
    [self buildCollectionView];
    [self buildTableHeadView];
}
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopCarBuyNumberDidChange) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeTableHeadViewHeightDidChange:) name:HomeTableHeadViewHeightDidChange object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)shopCarBuyNumberDidChange {
    [self.collectionView reloadData];
}
- (void)homeTableHeadViewHeightDidChange:(NSNotification *)notification {
    CGFloat height = [(NSNumber *)notification.object floatValue];
    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = height;
    self.homeHeadView.frame = CGRectMake(0, -height, Width, height);
    self.collectionView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0);
    self.collectionView.contentOffset = CGPointMake(0, -height);
}
#pragma initialize method
- (void)buildCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 8;
    layout.minimumLineSpacing = 8;
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    [self.collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:homeCellId];
    [self.collectionView registerClass:[HomeCategoryCell class] forCellWithReuseIdentifier:homeCategoryCellId];
    [self.collectionView registerClass:[HomeFooterCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerCellId];
    [self.collectionView registerClass:[HomeHeaderCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCellId];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    LFBRefreshHeader *header = [LFBRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    header.gifView.frame = CGRectMake(0, 30, 100, 100);
    self.collectionView.mj_header = header;
}

- (void)buildTableHeadView {
    __weak typeof(self) wself = self;
    [HomeHeadData loadHeadData:^(HomeHeadData *homeHeadData, NSError *error) {
        wself.homeHeadData = homeHeadData;
        self.homeHeadView = [[HomeHeadView alloc]initWithHeadData:homeHeadData];
        self.homeHeadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [wself showActityDetail:type tag:tag];
        };
        [self.collectionView addSubview:self.homeHeadView];
    }];
    [GoodsData loadGoodsData:^(NSArray<Goods *> *freshHots, NSError *error) {
        wself.freshHots = freshHots;
        [wself.collectionView reloadData];
    }];
    
}

#pragma collectionView datasourse

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.homeHeadData.category.act_rows.count;
    }else if(section == 1){
        return  self.freshHots.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCategoryCellId forIndexPath:indexPath];
        cell.actRow = self.homeHeadData.category.act_rows[indexPath.row];
        return cell;
    }
    
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCellId forIndexPath:indexPath];
    cell.goods = self.freshHots[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeZero;
    if (indexPath.section == 0) {
        itemSize = CGSizeMake(Width, 320);
    }else if (indexPath.section == 1){
        itemSize = CGSizeMake((Width - HomeCollectionViewCellMargin * 2) * 0.5 - 4, 250);
    }
    return itemSize;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(Width, HomeCollectionViewCellMargin);
    }else if(section == 1){
        return CGSizeMake(Width, HomeCollectionViewCellMargin * 3);
    }
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return CGSizeMake(Width, HomeCollectionViewCellMargin * 5);
    }
    return CGSizeZero;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HomeHeaderCell *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCellId forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [cell showTitleLable:NO];
        }else{
            [cell showTitleLable:YES];
        }
        return cell;
    }
    HomeFooterCell *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerCellId forIndexPath:indexPath];

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    Activity *activity = actInfo.act_rows[tag].activity;
    [self.navigationController pushViewController:[[WebViewController alloc]initWithActivity:activity] animated:YES];
}

#pragma callback
- (void)headerRefresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header endRefreshing];
    });
}
@end
