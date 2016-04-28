//
//  HomeCellTitleView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 15/10/11.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "HomeCellTitleView.h"
#import "UIColor+Extension.h"
@interface HomeCellTitleView()

@property (nonatomic,strong) UIView *rectangleView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *moreLabel;


@end

@implementation HomeCellTitleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _rectangleView = [[UIView alloc]init];
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"优选水果";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel sizeToFit];
        UILabel *moreLabel = [[UILabel alloc]init];
        moreLabel.text = @"更多 >";
        moreLabel.font = [UIFont systemFontOfSize:13];
        [moreLabel sizeToFit];
        moreLabel.textAlignment = NSTextAlignmentRight;
        moreLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0  blue:150/255.0  alpha:1.0];
        [self addSubview:_rectangleView];
        [self addSubview:_titleLabel];
        [self addSubview:moreLabel];
        
        [_rectangleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.width.mas_equalTo(5);
            make.height.mas_equalTo(15);
            make.centerY.equalTo(self);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_rectangleView.mas_trailing).offset(5);
            make.width.mas_equalTo(Width / 2);
            make.centerY.equalTo(self);
        }];
        
        [moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titleLabel.mas_trailing);
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
        
    }
    return self;
}
- (void)setActRow:(ActRow *)actRow {
    UIColor *color = [UIColor getColor:actRow.category_detail.category_color];
    self.rectangleView.backgroundColor = color;
    self.titleLabel.textColor = color;
    self.titleLabel.text = actRow.category_detail.name;
}
@end
