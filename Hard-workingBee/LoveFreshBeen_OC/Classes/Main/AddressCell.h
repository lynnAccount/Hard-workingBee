//
//  AdressCell.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/23.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressData.h"

typedef void(^ModifyCallback)(NSInteger tag);


@interface AddressCell : UITableViewCell

@property (nonatomic,strong) Address *address;

+ (instancetype)cellWithTable:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath callbackBlock:(ModifyCallback)callback;
@end
