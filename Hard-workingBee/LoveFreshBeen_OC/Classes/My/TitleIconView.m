//
//  TitleIconView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "TitleIconView.h"

@interface TitleIconView()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *iconImageView;;

@end

@implementation TitleIconView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_iconImageView];
        
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-10);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_iconImageView.mas_bottom).offset(3);
            make.leading.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}


- (instancetype)initWithTitleLabel:(NSString *)title icon:(UIImage *)image boder:(BOOL)showBorder {
    self = [self init];
    if (showBorder) {
        self.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
        self.layer.borderWidth = 0.5;
    }
    self.titleLabel.text = title;
    self.iconImageView.image = image;
    return self;
}

@end
