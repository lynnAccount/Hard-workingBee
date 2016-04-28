
//
//  UserInfo.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo()


@end

@implementation UserInfo

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static UserInfo *userInfo;
    dispatch_once(&onceToken, ^{
        userInfo = [[UserInfo alloc]init];
        [AddressData loadAdressData:^(NSArray *allAdress, NSError *error) {
            if (allAdress != nil) {
                userInfo.allAdress = [allAdress mutableCopy];
                userInfo.defaultAddress = allAdress[0];
            }
        }];
    });
    return userInfo;
}

- (Address *)defaultAddress
{
    return  _defaultAddress;
}


@end
