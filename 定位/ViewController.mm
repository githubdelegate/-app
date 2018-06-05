//
//  ViewController.m
//  定位
//
//  Created by zhangyun on 2018/6/4.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <Masonry.h>
#import "ZYUserCollectionViewCell.h"
#import "ZYUserModel.h"

#define ZYScreenW [UIScreen mainScreen].bounds.size.width
#define ZYScreenH [UIScreen mainScreen].bounds.size.height
#define UserCell @"usercell"

@interface ViewController ()<CLLocationManagerDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) CLLocationManager *clMgr;
@property (nonatomic,strong) UICollectionView *userCollectView;
@property (nonatomic,strong) UICollectionViewFlowLayout *userCollectViewLayout;
@property (nonatomic,strong) MAMapView *mapView;
@property (nonatomic,strong) NSMutableArray *userList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"where";
//    CLLocationManager *clMgr = [[CLLocationManager alloc] init];
//    self.clMgr = clMgr;
//    self.clMgr.delegate = self;
//    self.clMgr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
//    self.clMgr.activityType = CLActivityTypeFitness;
//
//    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
//        [clMgr requestAlwaysAuthorization];
//    }
//
    // 开始
//    clMgr.pausesLocationUpdatesAutomatically = YES;
//    [clMgr startMonitoringVisits];
//    [clMgr startMonitoringSignificantLocationChanges];
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *mapView = [[MAMapView alloc] init];
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    self.mapView = mapView;
    ///把地图添加至view
    [self.view addSubview:mapView];
    
    self.userCollectViewLayout = [[UICollectionViewFlowLayout alloc] init];
    self.userCollectViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.userCollectViewLayout.itemSize = CGSizeMake(60, 107);
    self.userCollectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.userCollectViewLayout];
    self.userCollectView.dataSource = self;
    self.userCollectView.backgroundColor = [UIColor whiteColor];
    [self.userCollectView registerClass:[ZYUserCollectionViewCell class] forCellWithReuseIdentifier:UserCell];
    [self.view addSubview:self.userCollectView];
    
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(ZYScreenH * 0.8);
    }];
    
    [self.userCollectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.mapView.mas_bottom);
    }];
}

- (NSArray *)userList{
    if (!_userList) {
        _userList = [NSMutableArray array];
        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }

        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }

        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }

        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }

        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }
        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }
        
        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"大大";
            u.avater = @"https://b-ssl.duitang.com/uploads/item/201805/16/20180516224000_ZFhf3.thumb.700_0.jpeg";
            [_userList addObject:u];
        }

    }
    
    return _userList;
}



#pragma mark - Collect View DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.userList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYUserCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:UserCell forIndexPath:indexPath];
    ZYUserModel *user = [self.userList objectAtIndex:indexPath.row];
    [cell setHeader:user.avater name:user.name];
    return cell;
}

//- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit{
//
//}
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    CLLocation *lastLocation = [locations lastObject];
//}
//
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
//    if (error.code == kCLAuthorizationStatusDenied) {
//        [self.clMgr stopMonitoringVisits];
//
//        NSLog(@" 没有授权 ,请授权");
//        return;
//    }
//}
//
//
//- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
//    if (status != kCLAuthorizationStatusAuthorizedAlways) {
//        // 不是一直定位,提示用户 需要开启一直定位
//    }
//
//    // 开启一直定位
//}

@end
