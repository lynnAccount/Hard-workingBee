//
//  AdressData.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/2.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "AddressData.h"

@implementation AddressData

+ (void)loadAdressData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MyAdress" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    AddressData *adressData = [AddressData mj_objectWithKeyValues:dic];
    complete(adressData.data,nil);
}

+ (NSDictionary *)mj_objectClassInArray {
    return  @{
              @"data" : NSStringFromClass([Address class])
              };
}

@end

@implementation Address



@end