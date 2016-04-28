//
//  ShopCartCell.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ShopCartCell.h"
#import "BuyView.h"
#import "NSString+Extension.h"

@interface ShopCartCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) BuyView *buyView;

@end

@implementation ShopCartCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel sizeToFit];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        [_priceLabel sizeToFit];
        _priceLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_priceLabel];
        
        
        _buyView = [[BuyView alloc]init];
        [self.contentView addSubview:_buyView];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(25);
            make.centerY.equalTo(self.contentView);
            make.trailing.equalTo(self).offset(-10);
        }];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(_buyView.mas_leading).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    ShopCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[ShopCartCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (void)setGoods:(Goods *)goods {
    self.titleLabel.text = [NSString stringWithFormat:@"[精选]%@",goods.name];
    self.priceLabel.text = [goods.price cleanDecimalPointZear];
    self.buyView.goods = goods;
}

@end
