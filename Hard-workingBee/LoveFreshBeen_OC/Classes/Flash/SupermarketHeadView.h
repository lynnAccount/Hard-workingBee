//
//  SupermarketHeadView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/15.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupermarketHeadView : UITableViewHeaderFooterView

@property (nonatomic,copy) NSString *title;


+ (instancetype)headerCellWith:(UITableView *)tableView;
@end
