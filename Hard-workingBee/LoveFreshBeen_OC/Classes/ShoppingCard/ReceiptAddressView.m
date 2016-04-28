//
//  ReceiptAddressView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/16.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ReceiptAddressView.h"

@interface ReceiptAddressView()


@property (nonatomic,strong) UILabel *consigneeLabel;
@property (nonatomic,strong) UILabel *phoneNumLabel;
@property (nonatomic,strong) UILabel *receiptLabel;

@property (nonatomic,strong) UILabel *consigneeTextLabel;
@property (nonatomic,strong) UILabel *phoneNumTextLabel;
@property (nonatomic,strong) UILabel *receiptTextLabel;

@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic,strong) UIImageView *bottomImageView;
@property (nonatomic,strong) UIImageView *arrowImageView;

@property (nonatomic,strong) UIButton *modifyBtn;
@property (nonatomic,copy) ModifyBtnCliked modifyBtnCliked;

@end

@implementation ReceiptAddressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_shoprail"]];
        _bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_shoprail"]];
        [self addSubview:_topImageView];
        [self addSubview:_bottomImageView];
        
        _consigneeLabel = [[UILabel alloc]init];
        _phoneNumLabel = [[UILabel alloc]init];
        _receiptLabel = [[UILabel alloc]init];
        _consigneeTextLabel = [[UILabel alloc]init];
        _phoneNumTextLabel = [[UILabel alloc]init];
        _receiptTextLabel = [[UILabel alloc]init];
        
        [self initLabel:_consigneeLabel title:@"收  货  人  "];
        [self initLabel:_phoneNumLabel title:@"电       话  "];
        [self initLabel:_receiptLabel title:@"收货地址  "];
        [self initLabel:_consigneeTextLabel title:@""];
        [self initLabel:_phoneNumTextLabel title:@""];
        [self initLabel:_receiptTextLabel title:@""];
        
        _modifyBtn = [[UIButton alloc]init];
        [_modifyBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _modifyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_modifyBtn setTitle:@"修改" forState:UIControlStateNormal];
        [_modifyBtn addTarget:self action:@selector(modifyAddress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_modifyBtn];
        
        _arrowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_go"]];
        [self addSubview:_arrowImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat leftMargin = 15;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.topImageView.frame = CGRectMake(0, 0, width, 2);
    self.bottomImageView.frame = CGRectMake(0, height - 2, width, 2);
    self.consigneeLabel.frame = CGRectMake(leftMargin, 10, self.consigneeLabel.frame.size.width, self.consigneeLabel.frame.size.height);
    self.consigneeTextLabel.frame = CGRectMake(CGRectGetMaxX(self.consigneeLabel.frame) + 5, self.consigneeLabel.frame.origin.y, 150, self.consigneeLabel.frame.size.height);
    self.phoneNumLabel.frame = CGRectMake(leftMargin, CGRectGetMaxY(self.consigneeLabel.frame) + 5, self.phoneNumLabel.frame.size.width, self.phoneNumLabel.frame.size.height);
    self.phoneNumTextLabel.frame = CGRectMake(self.consigneeTextLabel.frame.origin.x, self.phoneNumLabel.frame.origin.y, 150, self.phoneNumLabel.frame.size.height);
    self.receiptLabel.frame = CGRectMake(leftMargin, CGRectGetMaxY(self.phoneNumTextLabel.frame) + 5, self.receiptLabel.frame.size.width, self.receiptLabel.frame.size.height);
    self.receiptTextLabel.frame = CGRectMake(self.consigneeTextLabel.frame.origin.x, self.receiptLabel.frame.origin.y, 150, self.receiptLabel.frame.size.height);
    self.modifyBtn.frame = CGRectMake(width - 60, 0, 30, height);
    self.arrowImageView.frame = CGRectMake(width - 15, (height - self.arrowImageView.frame.size.height) * 0.5, self.arrowImageView.frame.size.width, self.arrowImageView.frame.size.height);
}
- (void)initLabel:(UILabel *)label title:(NSString *)text {
    label.text = text;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    [self addSubview:label];
}
- (void)modifyAddress {
    if (self.modifyBtnCliked) {
        self.modifyBtnCliked();
    }
}
- (instancetype)initWithFrame:(CGRect)frame modify:(ModifyBtnCliked)modifyBtnCliked {
    self = [self initWithFrame:frame];
    self.modifyBtnCliked = modifyBtnCliked;
    return self;
}
- (void)setAddress:(Address *)address {
    self.consigneeTextLabel.text = [NSString stringWithFormat:@"%@ 先生",address.accept_name];
    self.phoneNumTextLabel.text = address.telphone;
    self.receiptTextLabel.text = address.address;
}
@end
