//
//  OrderMenuView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "MenuView.h"
#import "TitleIconView.h"

/** 一行显示的个数  */
static const NSInteger DefaultRowNumbers = 4;

@interface MenuView()
@property (nonatomic,copy) NSArray<TitileIconAction *> *menus;
@property (nonatomic) BOOL showLine;
@end

@implementation MenuView


- (instancetype)initMenus:(NSArray<TitileIconAction *> *)menus WithLine:(BOOL)showLine {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.menus = menus;
        for (TitileIconAction *menu in menus) {
            TitleIconView *titleIconView = [[TitleIconView alloc]initWithTitleLabel:menu.title icon:menu.icon boder:showLine];
            titleIconView.userInteractionEnabled = YES;
            titleIconView.tag = menu.tag;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleIconViewCliked)];
            [titleIconView addGestureRecognizer:tap];
            [self addSubview:titleIconView];
        }   
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat viewW = self.bounds.size.width / DefaultRowNumbers;
    CGFloat viewH = self.bounds.size.height / (self.menus.count / DefaultRowNumbers);
    
    for (NSInteger i = 0;i < self.subviews.count;i++) {
        TitleIconView *titleIconView = self.subviews[i];
        CGFloat viewX = (i % DefaultRowNumbers )* viewW;
        CGFloat viewY = (i / DefaultRowNumbers) * viewH;
        titleIconView.frame = CGRectMake(viewX,viewY, viewW,viewH);
    }
}
- (void)titleIconViewCliked {

}

@end

