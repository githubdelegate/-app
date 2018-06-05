//
//  AppDelegate.m
//  定位
//
//  Created by zhangyun on 2018/6/4.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <Realm/Realm.h>
#import "ZYLoc.h"
#import "ZYBackLocationMgr.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AMapServices sharedServices].apiKey =@"a50f74228d38d5c427396206d9f98775";
    
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsLocationKey]) {
        ZYLoc *l = [ZYLoc new];
        l.desc = @"重启啦看到的数据";
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:l];
        }];
        [[ZYBackLocationMgr shareLocMgr] setAllowsBackgroundLocationUpdates:YES];
        [[ZYBackLocationMgr shareLocMgr] startMonitoringSignificantLocationChanges];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
