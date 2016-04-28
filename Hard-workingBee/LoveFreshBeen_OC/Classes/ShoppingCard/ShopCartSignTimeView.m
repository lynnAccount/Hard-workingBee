//
//  ShopCartSignTimeView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ShopCartSignTimeView.h"

@implementation ShopCartSignTimeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *signTimeTitleLabel = [[UILabel alloc]init];
        signTimeTitleLabel.text = @"收货时间";
        [signTimeTitleLabel sizeToFit];
        signTimeTitleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:signTimeTitleLabel];
        
        UILabel *signTimeLabel = [[UILabel alloc]init];
        signTimeLabel.text = @"闪电送,及时达";
        signTimeLabel.textColor = [UIColor redColor];
        signTimeLabel.font = [UIFont systemFontOfSize:15];
        [signTimeLabel sizeToFit];
        [self addSubview:signTimeLabel];
        
        UIButton *reserveBtn = [[UIButton alloc]init];
        [reserveBtn setTitle:@"可预订" forState:UIControlStateNormal];
        [reserveBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        reserveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:reserveBtn];
        UIImageView *arrowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_go"]];
        [self addSubview:arrowImageView];
        
        [signTimeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        [signTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(signTimeTitleLabel.mas_trailing).offset(10);
            make.centerY.equalTo(self);
        }];
        [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
        [reserveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(arrowImageView.mas_leading).offset(-20);
            make.centerY.equalTo(self);
        }];
        
    }
    return self;
}

@end
