//
//  ItemLeftButton.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/3.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "ItemLeftButton.h"

@implementation ItemLeftButton

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat offset = -20;
    self.titleLabel.frame = CGRectMake(offset, height - 15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, height - 15);
    self.imageView.contentMode = UIViewContentModeCenter;
}
@end

@implementation ItemRightButton

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat offset = 20;
    self.titleLabel.frame = CGRectMake(offset, height - 15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, height - 15);
    self.imageView.contentMode = UIViewContentModeCenter;
}

@end