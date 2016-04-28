//
//  TitileIcon.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitileIconAction : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) UIViewController *controller;
@property (nonatomic,assign) NSInteger tag;

+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controller tag:(NSInteger)tag;
@end
