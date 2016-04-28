//
//  ProductCell.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/14.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ProductCell.h"
#import "DiscountPriceView.h"
#import "BuyView.h"

@interface ProductCell()
/** 商品的图片 */
@property (nonatomic,strong) UIImageView *goodsImageView;
/** 商品名字的图片 */
@property (nonatomic,strong) UILabel *nameLabel;
/** 精选的图片 */
@property (nonatomic,strong) UIImageView *fineImageView;
/** 买一赠一的图片 */
@property (nonatomic,strong) UIImageView *giveImageView;
/** 商品单位的图片 */
@property (nonatomic,strong) UILabel *specificsLabel;
/** 折扣 */
@property (nonatomic,strong) DiscountPriceView *discountPriceView;
/** 选择数量 */
@property (nonatomic,strong) BuyView *buyView;
@property (nonatomic,strong) UIView *lineView;

@end

@implementation ProductCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        _goodsImageView = [[UIImageView alloc]init];
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _fineImageView = [[UIImageView alloc]init];
        [_fineImageView setImage:[UIImage imageNamed:@"jingxuan.png"]];
        _giveImageView = [[UIImageView alloc]init];
        [_giveImageView setImage:[UIImage imageNamed:@"buyOne.png"]];
        _specificsLabel = [[UILabel alloc]init];
        _specificsLabel.font = [UIFont systemFontOfSize:12];
        _specificsLabel.textColor = [UIColor darkGrayColor];
        _discountPriceView = [[DiscountPriceView alloc]init];
        _buyView = [[BuyView alloc]init];
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [self.contentView addSubview:_goodsImageView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_fineImageView];
        [self.contentView addSubview:_giveImageView];
        [self.contentView addSubview:_specificsLabel];
        [self.contentView addSubview:_discountPriceView];
        [self.contentView addSubview:_buyView];
        [self.contentView addSubview:_lineView];

        [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.leading.equalTo(self);
            make.width.mas_equalTo(self.mas_height);
            make.height.mas_equalTo(self.mas_height);
        }];
        
        [_fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsImageView.mas_trailing);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(15);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_fineImageView);
            make.leading.equalTo(_fineImageView.mas_trailing);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [_giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_fineImageView);
            make.top.equalTo(_fineImageView.mas_bottom).offset(2);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(15);
        }];
        [_specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_fineImageView);
            make.top.equalTo(_giveImageView.mas_bottom);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [_discountPriceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.leading.equalTo(_fineImageView);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(25);
        }];
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-5);
            make.trailing.equalTo(self).offset(-5);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(25);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}

-(void)setGoods:(Goods *)goods {
    [self.goodsImageView setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
    self.nameLabel.text = goods.name;
    if ([goods.pm_desc isEqualToString:@"买一赠一"]) {
        self.giveImageView.hidden = NO;
    }else{
        self.giveImageView.hidden = YES;
    }
    self.specificsLabel.text = goods.specifics;
    self.discountPriceView.goods = goods;
    self.buyView.goods = goods;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
