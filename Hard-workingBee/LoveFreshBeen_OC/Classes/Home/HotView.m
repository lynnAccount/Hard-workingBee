//
//  HotView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/7.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "HotView.h"
#import "IconImageTextView.h"
#import "AppConst.h"

@interface HotView()
@end

@implementation HotView

- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image {
    
    self = [super init];
    if (!self ) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<images.count; i++) {
        IconImageTextView *iconView = [IconImageTextView IconImageTextView:images[i] title:titles[i] placeHolder:image];
        iconView.tag = i;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicked:)];
        [iconView addGestureRecognizer:tap];
        [self addSubview:iconView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconW = (Width - 2 * DefaultMargin) / 4;
    CGFloat iconH = iconW * 0.68 + 20;
    for (NSInteger i = 0; i<self.subviews.count; i++) {
        IconImageTextView *iconView = self.subviews[i];
        CGFloat iconX = (i % 4) * iconW + DefaultMargin;
        CGFloat iconY = (i / 4) * iconH;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    
     self.bounds = CGRectMake(0, 0, Width, (self.subviews.count / 4) * iconH);
}

- (void)clicked:(UITapGestureRecognizer *)tap {
    if (self.callback) {
        self.callback(HeadViewItemTypeHot,tap.view.tag);
    }
}
@end
