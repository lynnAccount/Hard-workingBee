//
//  AdressCell.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/23.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "AddressCell.h"

@interface AddressCell()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UIImageView *modifyImageView;
@property (nonatomic,copy) ModifyCallback callback;

@end

@implementation AddressCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
        [self addSubview:_nameLabel];
        
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.font = [UIFont systemFontOfSize:14];
        _phoneLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
        [self addSubview:_phoneLabel];
        
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_addressLabel];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self addSubview:lineView];
        
        _modifyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_address_edit_highlighted"]];
        _modifyImageView.contentMode = UIViewContentModeCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(modifyImageViewCliked:)];
        _modifyImageView.userInteractionEnabled = YES;
        [_modifyImageView addGestureRecognizer:tap];
        [self addSubview:_modifyImageView];
        
        UIView *bottonView = [[UIView alloc]init];
        bottonView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self addSubview:bottonView];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.width.mas_equalTo(100);
            make.top.equalTo(self).offset(10);
            make.height.mas_equalTo(30);
        }];
        
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_nameLabel.mas_trailing);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            make.top.equalTo(_nameLabel.mas_top);
        }];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_nameLabel.mas_leading);
            make.width.mas_equalTo(200);
            make.bottom.equalTo(self).offset(-10);
            make.height.mas_equalTo(30);
        }];
        [_modifyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.trailing.equalTo(self).offset(-20);
        }];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(1);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.trailing.equalTo(_modifyImageView.mas_leading).offset(-10);
        }];
        
        [bottonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.leading.trailing.bottom.equalTo(self);
        }];
        
    }
    return self;
}


- (void)setAddress:(Address *)address {
    self.nameLabel.text = address.accept_name;
    self.phoneLabel.text = address.telphone;
    self.addressLabel.text = address.address;
}


+ (instancetype)cellWithTable:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath callbackBlock:(ModifyCallback)callback;{
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[AddressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.modifyImageView.tag = indexPath.row;
    cell.callback = callback;
    return cell;
}
- (void)modifyImageViewCliked:(UITapGestureRecognizer *)tap {
    if (self.callback) {
        self.callback(tap.view.tag);
    }
}
@end
