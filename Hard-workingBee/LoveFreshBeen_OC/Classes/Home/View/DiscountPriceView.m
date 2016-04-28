//
//  DiscountPriceView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/9.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "DiscountPriceView.h"
#import "NSString+Extension.h"

@interface DiscountPriceView()

@property (nonatomic,strong) UILabel *marketPriceLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic) BOOL hasMarketPrice;

@end

@implementation DiscountPriceView

- (instancetype)init{
    if (self = [super init]) {
        _marketPriceLabel = [[UILabel alloc]init];
        _marketPriceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_marketPriceLabel];
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_priceLabel];
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor blackColor];
        [self addSubview:_lineView];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.centerY.equalTo(self);
        }];
        [_marketPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_priceLabel.mas_trailing).offset(3);
            make.centerY.equalTo(self);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_marketPriceLabel.mas_width);
            make.height.mas_equalTo(1);
            make.leading.equalTo(_marketPriceLabel);
            make.centerY.equalTo(_marketPriceLabel);
        }];
        
    }
    return self;
}

-(void)setGoods:(Goods *)goods {
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",[goods.price cleanDecimalPointZear]];
    self.marketPriceLabel.text = [NSString stringWithFormat:@"￥%@",[goods.market_price cleanDecimalPointZear]];
    [self.priceLabel sizeToFit];
    [self.marketPriceLabel sizeToFit];
    if ([goods.price isEqualToString:goods.market_price]) {
        self.marketPriceLabel.hidden = YES;
        self.lineView.hidden = YES;
    }else{
        self.marketPriceLabel.hidden = NO;
        self.lineView.hidden = NO;
    }
}

@end
