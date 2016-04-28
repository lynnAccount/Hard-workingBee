//
//  AppDelegate.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/2/29.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "AppDelegate.h"
#import "AppConst.h"
#import "GuideViewController.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setAppStyle];
    [self addNotification];
    [self buildKeyWindow];
    return YES;
}
- (void)buildKeyWindow {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    NSString *isFirstOpenApp = [[NSUserDefaults standardUserDefaults] objectForKey:IsFristOpenApp];
    if (isFirstOpenApp == nil) {
        self.window.rootViewController = [GuideViewController new];
        [[NSUserDefaults standardUserDefaults] setObject:IsFristOpenApp forKey:IsFristOpenApp];
    }else{
        [self loadAdRootController];
    }
}
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMainTabarController) name:GuideViewControllerDidFinish object:nil];
}

- (void)loadAdRootController {
    self.window.rootViewController = [MainTabBarController new];
}

- (void)showMainTabarController {
    self.window.rootViewController = [MainTabBarController new];
}

- (void)setAppStyle {
    UITabBar *item = [UITabBar appearance];
    item.tintColor = [UIColor orangeColor];
    UINavigationBar *navgationBar = [UINavigationBar appearance];
    navgationBar.translucent = NO;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
