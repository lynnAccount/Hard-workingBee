//
//  MainTabBarController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/1.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"
#import "FlashViewController.h"
#import "MyViewController.h"
#import "BaseNavigationController.h"
#import "FreshReservationController.h"
#import "UserShopCarTool.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
    [self buildMainTabbarController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)buildMainTabbarController {
    [self setupChildViewController:@"首页" viewController:[HomeViewController new] image:@"v2_home" selectedImage:@"v2_home_r"];
    [self setupChildViewController:@"闪电超市" viewController:[FlashViewController new] image:@"v2_order" selectedImage:@"v2_order_r"];
    [self setupChildViewController:@"购物车" viewController:[ShoppingViewController new] image:@"shopCart" selectedImage:@"shopCart_r"];
    [self setupChildViewController:@"我的" viewController:[MyViewController new] image:@"v2_my" selectedImage:@"v2_my_r"];
}


- (void)setupChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [UIImage imageNamed:selectedImage];;
    item.title = title;
    controller.tabBarItem = item;
    BaseNavigationController *navController = [[BaseNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:navController];
}

- (void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopCarBuyNumberChanged) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
- (void)shopCarBuyNumberChanged {
    UIViewController *controller = self.childViewControllers[2];
    UITabBarItem *item = controller.tabBarItem;
    NSInteger goodsNumer = [[UserShopCarTool sharedInstance] getShopCarGoodsNumber];
    if (goodsNumer == 0) {
        item.badgeValue = nil;
        return;
    }
    item.badgeValue = [NSString stringWithFormat:@"%ld",goodsNumer];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
