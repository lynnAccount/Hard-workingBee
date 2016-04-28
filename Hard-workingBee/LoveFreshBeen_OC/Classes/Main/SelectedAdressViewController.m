//
//  SelectedAdressViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "SelectedAdressViewController.h"
#import "UIBarButtonItem+button.h"
#import "AdressTitleView.h"
#import "UserInfo.h"
#import "MyAdressViewController.h"

@interface SelectedAdressViewController ()
//@property (nonatomic,strong) AdressTitleView *titleView;

@end

@implementation SelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buildNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(leftItemClicked) type:LeftItemButton];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(rightItemClicked) type:RightItemButton];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:253/255.0 green:212/255.0 blue:49/255.0 alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated{
    Address *defaultAdress = [UserInfo sharedInstance].defaultAddress;
    if (defaultAdress) {
        AdressTitleView *titleView = [[AdressTitleView alloc]init];
        titleView.frame = CGRectMake(0, 0, [titleView adressViewWidth], 30);
        self.navigationItem.titleView = titleView;
        [self.navigationItem.titleView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleViewClicked)]];
    }
}

#pragma callback method

- (void)leftItemClicked {
    
}
- (void)rightItemClicked {

}
- (void)titleViewClicked {
    [self.navigationController pushViewController:[MyAdressViewController new] animated:YES];
}
@end
