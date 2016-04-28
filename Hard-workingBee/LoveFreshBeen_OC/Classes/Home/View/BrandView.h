//
//  BrandView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 15/10/11.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadData.h"

typedef NS_ENUM(NSInteger, BrandViewType) {
    BrandViewTypeThree,
    BrandViewTypeFour
};


@interface BrandView : UIView
- (instancetype)initWithActRow:(ActInfo *)actInfo;

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,copy) ClikedCallback callback;

@end
