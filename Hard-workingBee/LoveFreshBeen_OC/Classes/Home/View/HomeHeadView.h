//
//  HeadView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/7.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotView.h"
#import "PageScrollView.h"
#import "HomeHeadData.h"
#import "BrandView.h"
#import "HeadlineView.h"

@interface HomeHeadView : UIView

//@property (nonatomic,strong) HeadData *headData;
@property (nonatomic,strong) HotView *hotView;
@property (nonatomic,strong) PageScrollView *pageView;
@property (nonatomic,strong) BrandView *brandView;
@property (nonatomic,strong) BrandView *sceneView;
@property (nonatomic,strong) HeadlineView *headlineView;

- (instancetype)initWithHeadData:(HomeHeadData *)headData;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,copy) ClikedCallback callback;
@end
