//
//  CategoryCell.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/14.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperMarketSource.h"
@interface CategoryCell : UITableViewCell
/** 数据  */
@property (nonatomic,strong)ProductCategory *categroies;

+ (instancetype)cellWithTable:(UITableView *)tableView;
@end
