//
//  HeadView.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/7.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "HomeHeadView.h"



@implementation HomeHeadView

- (instancetype)initWithHeadData:(HomeHeadData *)headData {
    self = [super init];
    if (!self) {
        return  nil;
    }
    NSMutableArray *focusImages = [NSMutableArray array];
    NSMutableArray *iconImages = [NSMutableArray array];
    NSMutableArray *iconTitles = [NSMutableArray array];
    
    [headData.focus.act_rows enumerateObjectsUsingBlock:^(ActRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [focusImages addObject:obj.activity.img];
    }];
    [headData.icon.act_rows enumerateObjectsUsingBlock:^(ActRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [iconImages addObject:obj.activity.img];
        [iconTitles addObject:obj.activity.name];
    }];
    _pageView = [PageScrollView pageScollView:focusImages placeHolder:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    _hotView = [[HotView alloc] initWithImages:iconImages title:iconTitles placeHolder:[UIImage imageNamed:@"icon_icons_holder"]];
    
    _brandView = [[BrandView alloc]initWithActRow:headData.brand];
    _sceneView = [[BrandView alloc]initWithActRow:headData.scene];
    _headlineView = [[HeadlineView alloc]init];
    _headlineView.headline = headData.headline;
    [self addSubview:_headlineView];
    [self addSubview:_brandView];
    [self addSubview:_sceneView];
    [self addSubview:_pageView];
    [self addSubview:_hotView];
    [_hotView layoutIfNeeded];
    [_brandView layoutIfNeeded];
    [_sceneView layoutIfNeeded];
    [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(self.mas_width).multipliedBy(0.37);
    }];
    [_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pageView.mas_bottom);
        make.trailing.equalTo(self);
        make.leading.equalTo(self);
        make.height.mas_equalTo(_hotView.bounds.size.height);
    }];
    [_headlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hotView.mas_bottom);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [_brandView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headlineView.mas_bottom).offset(10);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(_brandView.bounds.size.height);
    }];
    [_sceneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_brandView.mas_bottom).offset(10);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(_sceneView.bounds.size.height);
    }];
    return self;
}
- (void)setHeight:(CGFloat)height {
    [[NSNotificationCenter defaultCenter] postNotificationName:HomeTableHeadViewHeightDidChange object:[NSNumber numberWithFloat:height]];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.height = CGRectGetMaxY(self.sceneView.frame);
}
- (void)setCallback:(ClikedCallback)callback {
    self.pageView.callback = callback;
    self.hotView.callback = callback;
    self.headlineView.callback = callback;
    self.brandView.callback = callback;
    self.sceneView.callback = callback;
}
@end
