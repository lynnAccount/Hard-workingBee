//
//  FlashViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/1.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "FlashViewController.h"
#import "ProductsViewController.h"
#import "SuperMarketSource.h"
#import "CategoryCell.h"
@interface FlashViewController ()<UITableViewDataSource,UITableViewDelegate,ProductsDelegate>

@property (nonatomic,strong) UITableView *categoriesTableView;
@property (nonatomic,strong) ProductsViewController *productsController;
@property (nonatomic,strong) SuperMarketData *superMarketData;

@end

@implementation FlashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildCategoriesTableView];
    [self buildProductsTableView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buildCategoriesTableView {
    self.categoriesTableView = ({
        UITableView *view = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.dataSource = self;
        view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        view.showsVerticalScrollIndicator = NO;
        view;
    });
    [self.view addSubview:self.categoriesTableView];
    [self.categoriesTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(self.view).multipliedBy(0.25);
    }];
}
- (void)buildProductsTableView {
    self.productsController = [[ProductsViewController alloc]init];
    [self addChildViewController:self.productsController];
    [self.view addSubview:self.productsController.view];
    self.delegate = self.productsController;
    self.productsController.delegate = self;
}
- (void)loadData {
    __weak typeof(self) wself = self;
    [SuperMarketSource loadSupermarketData:^(id data, NSError *error) {
        wself.superMarketData = data;
        [wself.categoriesTableView reloadData];
        [wself.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        wself.productsController.superMarketData = data;
    }];
}
#pragma datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.superMarketData.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [CategoryCell cellWithTable:tableView];
    cell.categroies = self.superMarketData.categories[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didTableView:clickedAtIndexPath:)]) {
        [self.delegate didTableView:self.categoriesTableView clickedAtIndexPath:indexPath];
    }
}
#pragma ProductsDelegate
-(void)willDislayHeaderView:(NSInteger)section {
    [self.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didEndDislayHeaderView:(NSInteger)section {
    [self.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:section + 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}




@end
