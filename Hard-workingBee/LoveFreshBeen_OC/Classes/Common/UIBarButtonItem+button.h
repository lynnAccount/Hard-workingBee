//
//  UIBarButtonItem+button.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/3.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ItemButtonType) {
    LeftItemButton,
    RightItemButton
};

@interface UIBarButtonItem (button)
+ (instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type;



@end
