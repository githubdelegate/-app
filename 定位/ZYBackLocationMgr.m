//
//  ZYLocationMgr.m
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "ZYBackLocationMgr.h"
#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "ZYLoc.h"

@interface ZYBackLocationMgr()<CLLocationManagerDelegate>
@end

@implementation ZYBackLocationMgr

+ (instancetype)shareLocMgr{
    static ZYBackLocationMgr *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZYBackLocationMgr alloc] init];
    });
    return instance;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setupconfig];
    }
    return self;
}

- (void)setupconfig{
    self.delegate = self;
    self.minSpeed = 3;
    self.minFilter = 50;
    self.minInteval = 10;
    
    self.delegate = self;
    self.distanceFilter  = self.minFilter;
    self.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations lastObject];
    [self adjustDistanceFilter:location];
    [self uploadLocation:location];
}


/**
 *  规则: 如果速度小于minSpeed m/s 则把触发范围设定为50m
 *  否则将触发范围设定为minSpeed*minInteval
 *  此时若速度变化超过10% 则更新当前的触发范围(这里限制是因为不能不停的设置distanceFilter,
 *  否则uploadLocation会不停被触发)
 */
- (void)adjustDistanceFilter:(CLLocation*)location{
    if ( location.speed < self.minSpeed ){
        if ( fabs(self.distanceFilter-self.minFilter) > 0.1f ){
            self.distanceFilter = self.minFilter;
        }
    }
    else{
        CGFloat lastSpeed = self.distanceFilter / self.minInteval;
        if ( (fabs(lastSpeed-location.speed)/lastSpeed > 0.1f) || (lastSpeed < 0) ){
            CGFloat newSpeed  = (int)(location.speed+0.5f);
            CGFloat newFilter = newSpeed*self.minInteval;
            self.distanceFilter = newFilter;
        }
    }
}


//这里仅用本地数据库模拟上传操作
- (void)uploadLocation:(CLLocation*)location{
    NSLog(@"uploadLocation");
    
//    MMLoc *loc = [MMLoc new];
//    loc.date       = [NSDate date];
//    loc.background = ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground);
//    loc.loc        = [NSString stringWithFormat:@"speed:%.0f filter:%.0f",location.speed,self.distanceFilter];
    ZYLoc *l = [ZYLoc new];
    l.latitude = location.coordinate.latitude;
    l.longitude = location.coordinate.longitude;
    l.desc = @"后台更新";
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:l];
    }];
    
#warning 如果有较长时间的操作 比如HTTP上传 请使用beginBackgroundTaskWithExpirationHandler
    //    if ( [UIApplication sharedApplication].applicationState == UIApplicationStateActive )
    //    {
    //        //TODO HTTP upload
    //
    //        [self endBackgroundUpdateTask];
    //    }
    //    else//后台定位
    //    {
    //        //假如上一次的上传操作尚未结束 则直接return
    //        if ( self.taskIdentifier != UIBackgroundTaskInvalid )
    //        {
    //            return;
    //        }
    //
    //        [self beingBackgroundUpdateTask];
    //
    //        //TODO HTTP upload
    //        //上传完成记得调用 [self endBackgroundUpdateTask];
    //    }
    
}


//- (void)beingBackgroundUpdateTask
//{
//    self.taskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        [self endBackgroundUpdateTask];
//    }];
//}
//
//- (void)endBackgroundUpdateTask
//{
//    if ( self.taskIdentifier != UIBackgroundTaskInvalid )
//    {
//        [[UIApplication sharedApplication] endBackgroundTask: self.taskIdentifier];
//        self.taskIdentifier = UIBackgroundTaskInvalid;
//    }
//}


@end
