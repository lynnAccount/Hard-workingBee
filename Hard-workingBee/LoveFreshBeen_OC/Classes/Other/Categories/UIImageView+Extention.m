//
//  UIImageView+Extention.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/10.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "UIImageView+Extention.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (Extention)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:url placeholderImage:placeholderImage];
}

@end
