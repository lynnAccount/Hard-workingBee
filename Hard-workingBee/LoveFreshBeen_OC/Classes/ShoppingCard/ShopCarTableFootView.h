//
//  ShopCarTableFootView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SureButtonCliked)();
@interface ShopCarTableFootView : UIView
@property (nonatomic,assign) CGFloat price;
@property (nonatomic,copy)SureButtonCliked sureButtonCliked;

@end
