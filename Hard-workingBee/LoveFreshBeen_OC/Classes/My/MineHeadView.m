//
//  MineHeadView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "MineHeadView.h"

@implementation MineHeadView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
        
        UIButton *button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
        [self addSubview:button];
        
        UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar"]];
        [self addSubview:headImageView];
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = @"18046552951";
        phoneLabel.font = [UIFont systemFontOfSize:20];
        phoneLabel.textColor = [UIColor whiteColor];
        phoneLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:phoneLabel];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(10);
            make.width.and.height.mas_equalTo(50);
        }];
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(50);
        }];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headImageView.mas_bottom).offset(5);
            make.leading.trailing.equalTo(self);
            make.height.equalTo(@30);
        }];
    }
    return self;
}
@end
