//
//  Activity.h
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/7.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HeadData;
@class Activity;
@class ExtParams;

@interface HeadResource : NSObject
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *msg;
@property (nonatomic,strong) HeadData *data;
+ (void)loadHeadData:(CompleteBlock)complete;
@end


@interface HeadData : NSObject

@property (nonatomic,copy) NSArray<Activity *> *focus;
@property (nonatomic,copy) NSArray<Activity *> *activities;
@property (nonatomic,copy) NSArray<Activity *> *icons;


@end

@interface Activity : NSObject
@property (nonatomic,copy) NSString *aid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *topimg;
@property (nonatomic,copy) NSString *jptype;
@property (nonatomic,copy) NSString *trackid;
@property (nonatomic,copy) NSString *mimg;
@property (nonatomic,strong) ExtParams *ext_params;


@end

@interface ExtParams : NSObject
@property (nonatomic,copy) NSString *cityid;
@property (nonatomic,copy) NSString *bigids;
@property (nonatomic,copy) NSString *activitygroup;
@end
