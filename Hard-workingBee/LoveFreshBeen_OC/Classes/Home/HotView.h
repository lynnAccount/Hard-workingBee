//
//  HotView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/7.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@class HotView;

//@protocol HotViewDelegate <NSObject>
//
//- (void)didHotViewCliked:(HotView *)hotView atIndex:(NSInteger)index;
//
//@end

@interface HotView : UIView

- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image;
@property (nonatomic,copy) ClikedCallback callback;
@end
