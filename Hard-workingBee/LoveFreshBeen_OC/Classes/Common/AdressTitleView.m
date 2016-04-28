//
//  AdressTitleView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "AdressTitleView.h"
#import "UserInfo.h"
#import "AddressData.h"

@interface AdressTitleView()

@property (nonatomic,strong) UILabel *playLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *arrowImage;

@end

@implementation AdressTitleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.playLabel = [[UILabel alloc]init];
        self.playLabel.text = @"配送至";
        self.playLabel.layer.borderWidth = 1;
        self.playLabel.font = [UIFont systemFontOfSize:10];
        [self.playLabel sizeToFit];
        [self addSubview:self.playLabel];
        [self.playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.centerY.equalTo(self);
        }];
        self.titleLabel = [[UILabel alloc]init];
        Address *address = [UserInfo sharedInstance].defaultAddress;
        if (address) {
            self.titleLabel.text = address.address;
        }else {
            self.titleLabel.text = @"您想送到哪儿";
        }
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.playLabel.mas_trailing).offset(5);
            make.centerY.equalTo(self.mas_centerY);
        }];
        self.arrowImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"allowBlack"]];
        [self addSubview:self.arrowImage];
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(6);
            make.leading.equalTo(self.titleLabel.mas_trailing).offset(5);
            make.centerY.equalTo(self);
        }];        
    }
    return self;
}
- (CGFloat)adressViewWidth {
    [self layoutIfNeeded];
    return CGRectGetMaxX(self.arrowImage.frame);;
}
- (void)setTitle:(Address *)adress {
    self.titleLabel.text = adress.address;
 }
@end
