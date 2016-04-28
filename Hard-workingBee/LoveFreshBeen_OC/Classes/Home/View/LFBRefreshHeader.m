//
//  LFBRefreshHeader.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 15/10/11.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "LFBRefreshHeader.h"

@implementation LFBRefreshHeader

- (void)prepare {
    [super prepare];
    self.stateLabel.hidden = NO;
    self.lastUpdatedTimeLabel.hidden = YES;

    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh1"]] forState:MJRefreshStateIdle];
    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh2"]] forState:MJRefreshStatePulling];
    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh1"],[UIImage imageNamed:@"v2_pullRefresh2"]] forState:MJRefreshStateRefreshing];
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
}

@end
