//
//  AdressData.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Address;
@interface AddressData : NSObject
@property (nonatomic) NSInteger code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSArray<Address *> *data;

+ (void)loadAdressData:(CompleteBlock)complete ;
@end

@interface Address : NSObject

@property (nonatomic,copy) NSString *accept_name;
@property (nonatomic,copy) NSString *telphone;
@property (nonatomic,copy) NSString *province_name;
@property (nonatomic,copy) NSString *city_name;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *lng;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *gender;

@end