//
//  OrderMenuView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitileIconAction.h"

@interface MenuView : UIView
- (instancetype)initMenus:(NSArray<TitileIconAction *> *)menus WithLine:(BOOL)showLine;
@end
