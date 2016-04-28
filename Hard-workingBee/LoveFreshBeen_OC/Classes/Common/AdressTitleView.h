//
//  AdressTitleView.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Address;
@interface AdressTitleView : UIView
- (CGFloat)adressViewWidth;
- (void)setTitle:(Address *)adress;
@end
