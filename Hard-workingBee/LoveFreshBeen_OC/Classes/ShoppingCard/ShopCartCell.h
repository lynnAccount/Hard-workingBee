//
//  ShopCartCell.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"
@interface ShopCartCell : UITableViewCell

@property (nonatomic,strong) Goods *goods;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
