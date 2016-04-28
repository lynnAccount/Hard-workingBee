//
//  MyOrderView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "MyOrderHeadView.h"

@implementation MyOrderHeadView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *myOrderLabel = [[UILabel alloc]init];
        myOrderLabel.text = @"我的订单";
        myOrderLabel.font = [UIFont systemFontOfSize:14];
        [myOrderLabel sizeToFit];
        [self addSubview:myOrderLabel];
        UILabel *checkOrderLabel = [[UILabel alloc]init];
        checkOrderLabel.text = @"查看全部订单";
        checkOrderLabel.font = [UIFont systemFontOfSize:14];
        checkOrderLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        [checkOrderLabel sizeToFit];
        [self addSubview:checkOrderLabel];
        UIImageView *arrowView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_go"]];
        [self addSubview:arrowView];
        
        [myOrderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        [arrowView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
        
        [checkOrderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(arrowView.mas_leading).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
@end
