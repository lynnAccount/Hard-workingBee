//
//  UIBarButtonItem+button.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/3.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "UIBarButtonItem+button.h"
#import "ItemLeftButton.h"

@implementation UIBarButtonItem (button)

+ (instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type {
    UIButton *button;
    if (type == LeftItemButton) {
        button = [ItemLeftButton buttonWithType:UIButtonTypeCustom];
    }else{
        button = [ItemRightButton buttonWithType:UIButtonTypeCustom];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 60, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
