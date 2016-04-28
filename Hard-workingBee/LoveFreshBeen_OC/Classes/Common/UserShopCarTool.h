//
//  UserShopCarTool.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/9.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goods.h"

@interface UserShopCarTool : NSObject
@property (nonatomic,strong) NSMutableArray<Goods *> *shopCar;

+ (instancetype)sharedInstance;
- (void)addSupermarkProductToShopCar:(Goods *)goods;
- (void)removeFromProductShopCar:(Goods*)goods;
- (CGFloat)getShopCarGoodsPrice ;
- (NSInteger)getShopCarGoodsNumber;
- (BOOL)isEmpty;
@end
