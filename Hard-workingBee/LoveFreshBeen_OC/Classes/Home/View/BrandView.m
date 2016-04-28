//
//  BrandView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 15/10/11.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "BrandView.h"

@interface BrandView()

@property (nonatomic,strong) ActInfo *actInfo;
@property (nonatomic) BrandViewType type;
@property (nonatomic,assign) NSInteger rowMaxItem;
@property (nonatomic,assign) CGFloat imageViewW;
@property (nonatomic,assign) CGFloat imageViewH;

@end

@implementation BrandView

- (instancetype)initWithActRow:(ActInfo *)actInfo {
    if (self = [super init]) {
        self.actInfo = actInfo;
        for (NSInteger i = 0; i < actInfo.act_rows.count; i++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
            imageView.layer.borderWidth = 0.5;
            [imageView setImageWithURL:[NSURL URLWithString:actInfo.act_rows[i].activity.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
            imageView.tag = i;
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewCliked:)];
            [imageView addGestureRecognizer:tap];
            [self addSubview:imageView];
        }
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        UIImageView *imageView = self.subviews[i];
        CGFloat imageViewX = (i % self.rowMaxItem) * self.imageViewW;
        CGFloat imageViewY = (i / self.rowMaxItem) * self.imageViewH;
        imageView.frame = CGRectMake(imageViewX, imageViewY, self.imageViewW, self.imageViewH);
    }
    self.bounds = CGRectMake(0, 0, Width, self.imageViewH * (self.actInfo.act_rows.count / self.rowMaxItem));
}
- (void)setActInfo:(ActInfo *)actInfo {
    _actInfo = actInfo;
    if ([actInfo.type isEqualToString:@"brand"]) {
        self.type = BrandViewTypeThree;
    }else{
        self.type = BrandViewTypeFour;
    }
}
- (void)setType:(BrandViewType)type {
    _type = type;
    
    if (type == BrandViewTypeThree) {
        self.rowMaxItem = 3;
        self.imageViewW = Width / self.rowMaxItem;
        self.imageViewH = self.imageViewW * 1.3;
    }else{
        self.rowMaxItem = 2;
        self.imageViewW = Width / self.rowMaxItem;
        self.imageViewH = self.imageViewW * 0.4;
    }
    
}

- (CGFloat)height {
    return self.imageViewH * (self.actInfo.act_rows.count / self.rowMaxItem);
}

- (void)imageViewCliked:(UITapGestureRecognizer *)tap {
    if (!self.callback) return;
    if (self.type == BrandViewTypeThree) {
        self.callback(HeadViewItemTypeBrand,tap.view.tag);
    }else{
        self.callback(HeadViewItemTypeScene,tap.view.tag);
    }
}
@end
