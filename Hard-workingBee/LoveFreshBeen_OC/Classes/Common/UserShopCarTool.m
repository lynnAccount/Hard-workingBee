//
//  UserShopCarTool.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/9.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "UserShopCarTool.h"
#import "NSString+Extension.h"
@implementation UserShopCarTool

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    static UserShopCarTool *shopCarTool;
    dispatch_once(&onceToken, ^{
        if (shopCarTool == nil) {
            shopCarTool = [UserShopCarTool new];
        }
    });
    return shopCarTool;
}

- (NSMutableArray<Goods *> *)shopCar
{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
    }
    return  _shopCar;
}

#pragma 添加商品
- (void)addSupermarkProductToShopCar:(Goods *)goods {
    
    
    for (Goods *obj in self.shopCar) {
        if (obj.gid == goods.gid) {
            return;
        }
    }
    [self.shopCar addObject:goods];
}
#pragma 删除商品 
- (void)removeFromProductShopCar:(Goods*)goods {
    for (Goods *obj in self.shopCar) {
        if (goods.gid == obj.gid) {
            [self.shopCar removeObject:goods];
            [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarDidRemoveProductNSNotification object:self userInfo:nil];
            return ;
        }
    }
}
#pragma 获取商品的数量
- (NSInteger)getShopCarGoodsNumber {
    __block NSInteger count = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(Goods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userBuyNumber;
    }];
    return count;
}
#pragma 获取商品用价格
- (CGFloat)getShopCarGoodsPrice {
    __block CGFloat price = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(Goods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        price += [[obj.price cleanDecimalPointZear] doubleValue] * obj.userBuyNumber;
    }];
    return price;
}
- (BOOL)isEmpty {
    return self.shopCar.count == 0;
}
@end
