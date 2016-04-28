//
//  CategoryCell.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/14.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "CategoryCell.h"

@interface CategoryCell()
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UIView *yellowView;
@property (nonatomic,strong) UIView *lineView;
@end

static NSString *cellId = @"cell";

@implementation CategoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"llll"];
        _backImageView.highlightedImage = [UIImage imageNamed:@"kkkkkkk"];
        [self.contentView addSubview:_backImageView];
        _yellowView = [[UIView alloc]init];
        _yellowView.backgroundColor = [UIColor colorWithRed:253/255.0 green:212/255.0 blue:49/255.0 alpha:1.0];
        [self.contentView addSubview:_yellowView];
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [self.contentView addSubview:_lineView];
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor grayColor];
        _nameLabel.highlightedTextColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLabel];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
            make.width.mas_equalTo(5);
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.nameLabel.highlighted = selected;
    self.yellowView.hidden = !selected;
    self.backImageView.highlighted = selected;
}

- (void)setCategroies:(ProductCategory *)categroies {
    self.nameLabel.text = categroies.name;
}

+ (instancetype)cellWithTable:(UITableView *)tableView {
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[CategoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
