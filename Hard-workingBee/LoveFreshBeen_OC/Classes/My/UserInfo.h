//
//  UserInfo.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressData.h"
@interface UserInfo : NSObject

@property (nonatomic,strong) NSMutableArray *allAdress;

+ (instancetype)sharedInstance;
@property (nonatomic,strong) Address *defaultAddress;

@end
