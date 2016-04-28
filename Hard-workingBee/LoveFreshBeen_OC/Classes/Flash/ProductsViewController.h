//
//  ProductsViewController.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/14.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "BaseViewController.h"
#import "SuperMarketSource.h"
#import "FlashViewController.h"

@protocol ProductsDelegate <NSObject>

- (void)didEndDislayHeaderView:(NSInteger)section;
- (void)willDislayHeaderView:(NSInteger)section;
@end

@interface ProductsViewController : BaseViewController<FlashTableViewDelagate>

@property (nonatomic,strong) SuperMarketData *superMarketData;

@property (nonatomic,weak) id<ProductsDelegate>delegate;

@end
