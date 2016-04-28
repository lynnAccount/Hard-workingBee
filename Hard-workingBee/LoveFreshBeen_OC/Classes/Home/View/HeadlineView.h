//
//  HeadlineView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/10.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeHeadData.h"

@interface HeadlineView : UIView
@property (nonatomic,strong) ActInfo *headline;
@property (nonatomic,copy) ClikedCallback callback;
@end
