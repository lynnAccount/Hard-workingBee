//
//  FooterBannerData.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/18.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "FooterBannerData.h"

@implementation FooterBannerData
+ (void)loadFootBannerData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"footerBanner" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    FooterBannerData *footerBannerData = [FooterBannerData mj_objectWithKeyValues:json];
    complete(footerBannerData.data,nil);
}


+ (NSDictionary *)mj_objectClassInArray {
    return @{
        @"data" : NSStringFromClass([Activity class])
    };
}
@end
