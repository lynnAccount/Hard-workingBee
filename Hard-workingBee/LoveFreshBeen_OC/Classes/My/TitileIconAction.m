//
//  TitileIcon.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "TitileIconAction.h"

@implementation TitileIconAction


+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controller tag:(NSInteger)tag {
    TitileIconAction *titleIconAction = [[self alloc]init];
    titleIconAction.title = title;
    titleIconAction.icon = image;
    titleIconAction.controller = controller;
    titleIconAction.tag = tag;
    return titleIconAction;
}
@end
