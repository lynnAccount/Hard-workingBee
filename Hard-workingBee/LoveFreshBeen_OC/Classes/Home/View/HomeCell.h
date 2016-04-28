//
//  HomeCell.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/8.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "Goods.h"

typedef NS_ENUM(NSInteger, HomeCellType) {
    HomeCellTypeVertical,
    HomeCellTypeHorizontal
};
@interface HomeCell : UICollectionViewCell
@property (nonatomic,strong) Goods *goods;
@property (nonatomic,strong) Activity *activity;
@property (nonatomic) BOOL buyViewShowZear;

@end
