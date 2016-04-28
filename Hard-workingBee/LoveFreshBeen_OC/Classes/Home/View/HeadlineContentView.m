//
//  HeadlineScrollView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/10.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "HeadlineContentView.h"

@interface HeadlineContentView()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation HeadlineContentView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.layer.borderColor = [UIColor redColor].CGColor;
        _titleLabel.layer.borderWidth = 1;
        _titleLabel.layer.cornerRadius = 3;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel sizeToFit];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        [self addSubview:_contentLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(18);
        }];
        [_contentLabel sizeToFit];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titleLabel.mas_trailing).offset(10);
            make.centerY.equalTo(self);
        }];
        
    }
    return self;
}
- (void)setActRow:(ActRow *)actRow {
    self.titleLabel.text = actRow.headline_detail.title;
    self.contentLabel.text = actRow.headline_detail.content;
}
@end
