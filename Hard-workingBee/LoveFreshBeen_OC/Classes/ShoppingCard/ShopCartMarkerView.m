//
//  ShopCartMarkerView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ShopCartMarkerView.h"

@implementation ShopCartMarkerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_lighting"]];
        [self addSubview:imageView];
        UILabel *marketTitleLabel = [[UILabel alloc]init];
        marketTitleLabel.text = @"闪电超市";
        marketTitleLabel.font = [UIFont systemFontOfSize:12];
        marketTitleLabel.textColor = [UIColor lightGrayColor];
        [marketTitleLabel sizeToFit];
        [self addSubview:marketTitleLabel];
        UILabel *marketTipsLabel = [[UILabel alloc]init];
        marketTipsLabel.text = @"   22:00前满$30免运费,22:00后满$50面运费";
        [marketTipsLabel sizeToFit];
        marketTipsLabel.textColor = [UIColor lightGrayColor];
        marketTipsLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:marketTipsLabel];
        UIImageView *redDotImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"reddot"]];
        [self addSubview:redDotImageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.top.equalTo(self).offset(5);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [marketTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(imageView.mas_trailing).offset(15);
            make.centerY.equalTo(imageView);
        }];
        [redDotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.top.equalTo(imageView.mas_bottom).offset(20);
            make.width.mas_equalTo(4);
            make.height.mas_equalTo(4);
        }];
        [marketTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(redDotImageView.mas_trailing).offset(15);
            make.centerY.equalTo(redDotImageView);
        }];
    }
    return self;
}

@end
