//
//  ProductsViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/14.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductCell.h"
#import "SupermarketHeadView.h"
#import "LFBRefreshHeader.h"
@interface ProductsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic) CGFloat lastOffsetY;
@property (nonatomic) BOOL isScrollDown;
@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNotification];
    [self buildProductTableView];
}
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopCarBuyNumberDidChange) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
- (void)shopCarBuyNumberDidChange {
    [self.tableView reloadData];
}
-(void)loadView {
    self.view = [[UIView alloc]initWithFrame:CGRectMake(Width * 0.25, 0, Width * 0.75, Height - 64 - 49)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buildProductTableView {
    self.tableView = ({
        UITableView *view = [[UITableView alloc]init];
        view.delegate = self;
        view.dataSource = self;
        view.showsVerticalScrollIndicator = NO;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    LFBRefreshHeader *header = [LFBRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
//    header.gifView.frame = CGRectMake(30, 0, 100, 100);
    self.tableView.mj_header = header;
}
- (void)headerRefresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}
#pragma tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.superMarketData.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.superMarketData.categories[section].products.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [ProductCell cellWithTableView:tableView];
    cell.goods = self.superMarketData.categories[indexPath.section].products[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SupermarketHeadView *headerView = [SupermarketHeadView headerCellWith:tableView];
    headerView.title = self.superMarketData.categories[section].name;
    return headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (!self.isScrollDown && [self.delegate respondsToSelector:@selector(willDislayHeaderView:)]) {
        [self.delegate willDislayHeaderView:section];
    }
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.isScrollDown && [self.delegate respondsToSelector:@selector(didEndDislayHeaderView:)]) {
        [self.delegate didEndDislayHeaderView:section];
    }
}
#pragma scorllView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.isScrollDown = self.lastOffsetY < scrollView.contentOffset.y;
    self.lastOffsetY = scrollView.contentOffset.y;
}

#pragma flashTableViewdelegate
- (void)didTableView:(UITableView *)tableView clickedAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
- (void)setSuperMarketData:(SuperMarketData *)superMarketData {
    _superMarketData = superMarketData;
    [self.tableView reloadData];
}
@end
