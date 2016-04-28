//
//  GuideCell.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/1.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "GuideCell.h"


@interface GuideCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIButton *button;

@end

@implementation GuideCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 图片
        _imageView = [[UIImageView alloc]init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        // 下一步按钮
        _button = [[UIButton alloc]init];
        [_button setBackgroundImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
        _button.hidden = true;
        [_button addTarget:self action:@selector(nextButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.mas_equalTo(100);
            make.height.mas_equalTo(33);
            make.bottom.equalTo(self.mas_bottom).offset(-100);
        }];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)nextButtonclicked:(UIButton *)button {
    [[NSNotificationCenter defaultCenter]postNotificationName:GuideViewControllerDidFinish object:nil];
}

- (void)setNextButtonHidden:(BOOL)hidden {
    self.button.hidden = hidden;
}
@end
