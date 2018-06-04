//
//  ViewController.m
//  定位
//
//  Created by zhangyun on 2018/6/4.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *clMgr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationManager *clMgr = [[CLLocationManager alloc] init];
    self.clMgr = clMgr;
    self.clMgr.delegate = self;
    self.clMgr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.clMgr.activityType = CLActivityTypeFitness;
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        [clMgr requestAlwaysAuthorization];
    }
    
    // 开始
    clMgr.pausesLocationUpdatesAutomatically = YES;
    [clMgr startMonitoringVisits];
    [clMgr startMonitoringSignificantLocationChanges];
}


- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit{
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *lastLocation = [locations lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if (error.code == kCLAuthorizationStatusDenied) {
        [self.clMgr stopMonitoringVisits];
        
        NSLog(@" 没有授权 ,请授权");
        return;
    }
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status != kCLAuthorizationStatusAuthorizedAlways) {
        // 不是一直定位,提示用户 需要开启一直定位
    }
    
    // 开启一直定位
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
}

@end
