//
//  ShopCartCommentsView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ShopCartCommentsView.h"

@implementation ShopCartCommentsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"收货备注";
        [titleLabel sizeToFit];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:titleLabel];
        
        UITextField *textField = [[UITextField alloc]init];
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.font = [UIFont systemFontOfSize:15];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @"可输入100字以内特殊要求内容";
        [self addSubview:textField];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.width.mas_equalTo(60);
            make.centerY.equalTo(self);
        }];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(titleLabel.mas_trailing).offset(10);
            make.centerY.equalTo(self);
            make.trailing.equalTo(self).offset(-20);
        }];
        
    }
    return self;
}

@end
