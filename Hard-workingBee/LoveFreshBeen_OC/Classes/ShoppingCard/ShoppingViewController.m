//
//  ShoppingViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/1.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "ShoppingViewController.h"
#import "EmptyShopCarView.h"
#import "ReceiptAddressView.h"
#import "ShopCartMarkerView.h"
#import "ShopCartSignTimeView.h"
#import "ShopCartCommentsView.h"
#import "ShopCartCell.h"
#import "UserShopCarTool.h"
#import "UserInfo.h"
#import "ShopCarTableFootView.h"
#import "OrderPayWayViewController.h"

@interface ShoppingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIView *tableHeadView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) EmptyShopCarView *emptyUI;
@property (nonatomic,strong) NSArray *shopCar;
@property (nonatomic,strong) ShopCarTableFootView *tableFootView;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    self.title = @"购物车";
    [self addNotification];
    [super viewDidLoad];
    [self buildTableView];
    [self buildEmptyUI];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRemoveProduct) name:LFBShopCarDidRemoveProductNSNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buyNumberChange) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
- (void)buildTableView {
    
    self.tableView = ({
        UITableView *view =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        view.delegate = self;
        view.dataSource = self;
        view.showsVerticalScrollIndicator = NO;
        view.hidden = YES;
        view.backgroundColor = [UIColor clearColor];
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self buildTableHeadView];
    [self buildTableFootView];
}

- (void)buildEmptyUI{
    self.emptyUI = [[EmptyShopCarView alloc]init];
    self.emptyUI.hidden = YES;
    [self.view addSubview:self.emptyUI];
    [self.emptyUI mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(170);
    }];
}

- (void)buildTableHeadView {
    self.tableHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 250)];
    self.tableHeadView.backgroundColor = self.view.backgroundColor;
    ReceiptAddressView *addressView = [[ReceiptAddressView alloc]initWithFrame:CGRectMake(0, 10, Width, 70)];
    addressView.address = [UserInfo sharedInstance].defaultAddress;
    ShopCartMarkerView *marketView = [[ShopCartMarkerView alloc]initWithFrame:CGRectMake(0, 90, Width, 60)];
    ShopCartSignTimeView *signTimeView = [[ShopCartSignTimeView alloc]initWithFrame:CGRectMake(0, 150, Width, 50)];
    ShopCartCommentsView *commentsView = [[ShopCartCommentsView alloc]initWithFrame:CGRectMake(0, 200, Width, 50)];
    
    [self addToHeadViewWithBorder:addressView];
    [self addToHeadViewWithBorder:marketView];
    [self addToHeadViewWithBorder:signTimeView];
    [self addToHeadViewWithBorder:commentsView];
    self.tableView.tableHeaderView = self.tableHeadView;
    ;
}
- (void)buildTableFootView {
    self.tableFootView = [[ShopCarTableFootView alloc]initWithFrame:CGRectMake(0, 0, Width, 50)];
    self.tableFootView.price = [[UserShopCarTool sharedInstance] getShopCarGoodsPrice];
    __weak typeof(self) wSelf = self;
    self.tableFootView.sureButtonCliked = ^{
        [wSelf.navigationController pushViewController:[OrderPayWayViewController new] animated:YES];
    };
    self.tableView.tableFooterView = self.tableFootView;
    
}
- (void)addToHeadViewWithBorder:(UIView *)view {
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
    [self.tableHeadView addSubview:view];
}
- (void)viewWillAppear:(BOOL)animated {
    if ([[UserShopCarTool sharedInstance]isEmpty]) {
        self.emptyUI.hidden = NO;
        self.tableView.hidden = YES;
    }else {
        self.emptyUI.hidden = YES;
        [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]];
        [SVProgressHUD showWithStatus:@"信息正在加载中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.shopCar = [UserShopCarTool sharedInstance].shopCar;
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
            self.tableView.hidden = NO;
        });
    }
}
- (void)didRemoveProduct {
    if (self.shopCar.count == 0) {
        self.emptyUI.hidden = NO;
        self.tableView.hidden = YES;
        return;
    }
    [self.tableView reloadData];
}
- (void)buyNumberChange {
    self.tableFootView.price = [[UserShopCarTool sharedInstance] getShopCarGoodsPrice];
}
#pragma datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shopCar.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShopCartCell *cell = [ShopCartCell cellWithTableView:tableView];
    cell.goods = self.shopCar[indexPath.row];
    return cell;
}

@end
