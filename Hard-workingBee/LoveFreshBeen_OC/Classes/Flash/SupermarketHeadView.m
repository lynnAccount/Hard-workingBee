//
//  SupermarketHeadView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/15.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "SupermarketHeadView.h"

@interface SupermarketHeadView()

@property (nonatomic,strong) UILabel *titleView;

@end

@implementation SupermarketHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        _titleView = [[UILabel alloc]init];
        _titleView.backgroundColor = [UIColor clearColor];
        _titleView.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        _titleView.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.leading.equalTo(self).offset(10);
        }];
    }
    return self;
}

+ (instancetype)headerCellWith:(UITableView *)tableView {
    SupermarketHeadView *headerCell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (headerCell == nil) {
        headerCell = [[SupermarketHeadView alloc]initWithReuseIdentifier:@"header"];
    }
    return headerCell;
}
- (void)setTitle:(NSString *)title {
    self.titleView.text = title;
}
@end
