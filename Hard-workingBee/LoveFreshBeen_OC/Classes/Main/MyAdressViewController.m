//
//  MyAdressViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/23.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "MyAdressViewController.h"
#import "AddressCell.h"
#import "UserInfo.h"
@interface MyAdressViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *addreses;

@end

@implementation MyAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildNavigationItem];
    [self buildAddressTableView];
    [self builNullAddressView];
    [self loadAddressData];
    [self buildBottonView];
}

- (void)buildNavigationItem {
    self.navigationItem.title = @"我的收货地址";
}

- (void)buildAddressTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 80;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-60);
    }];
    self.tableView = tableView;
}
- (void)loadAddressData {
    __weak typeof(self) wSelf = self;
    [AddressData loadAdressData:^(id data, NSError *error) {
        wSelf.addreses = data;
        [wSelf.tableView reloadData];
    }];
}
- (void)builNullAddressView {

}
- (void)buildBottonView {
    UIView *bottonView = [[UIView alloc]init];
    bottonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottonView];
    [bottonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor colorWithRed:253/255.0 green:212/255.0 blue:49/255.0 alpha:1.0];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"+ 新增地址" forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addAddressButtonCliked) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    [bottonView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottonView).offset(12);
        make.width.equalTo(bottonView).multipliedBy(0.7);
        make.centerX.equalTo(bottonView);
        make.bottom.equalTo(bottonView).offset(-12);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addreses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressCell *cell = [AddressCell cellWithTable:tableView indexPath:indexPath callbackBlock:^(NSInteger tag) {
        
    }];
    cell.address = self.addreses[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UserInfo sharedInstance].defaultAddress = self.addreses[indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addAddressButtonCliked {}
@end
