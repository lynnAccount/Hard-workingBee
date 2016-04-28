//
//  ShopCarTableFootView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ShopCarTableFootView.h"
#import "NSString+Extension.h"

@interface ShopCarTableFootView()

@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIButton *sureButton;

@end

@implementation ShopCarTableFootView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_priceLabel];
        
        _sureButton = [[UIButton alloc]init];
        _sureButton.backgroundColor = [UIColor colorWithRed:253/255.0 green:212/255.0 blue:49/255.0 alpha:1.0];
        [_sureButton setTitle:@"选好了" forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sureButton addTarget:self action:@selector(sureButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureButton];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(100);
            make.height.equalTo(self);
        }];
        
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(90);
        }];
    }
    return self;
}
- (void)sureButtonCliked:(id)sender {
    if (self.sureButtonCliked) {
        self.sureButtonCliked();
    }
}
- (void)setPrice:(CGFloat)price {
    NSString *priceStr = [[NSString stringWithFormat:@"%f",price] cleanDecimalPointZear];
    self.priceLabel.text = [NSString stringWithFormat:@"共 $%@",priceStr];
}
@end
