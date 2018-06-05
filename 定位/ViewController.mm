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
#import <YYKit/YYKit.h>
#import "ZYLoc.h"
#import "TestTableViewController.h"

#define ZYScreenW [UIScreen mainScreen].bounds.size.width
#define ZYScreenH [UIScreen mainScreen].bounds.size.height
#define UserCell @"usercell"

@interface ViewController ()<CLLocationManagerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,MAMapViewDelegate>
@property (nonatomic,strong) CLLocationManager *clMgr;
@property (nonatomic,strong) UICollectionView *userCollectView;
@property (nonatomic,strong) UICollectionViewFlowLayout *userCollectViewLayout;
@property (nonatomic,strong) MAMapView *mapView;
@property (nonatomic,strong) NSMutableArray *userList;
@property (nonatomic,assign) BOOL mapLoaded; // 地图是否已经加载完成
@end

@implementation ViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"where";
//    CLLocationManager *clMgr = [[CLLocationManager alloc] init];
//    self.clMgr = clMgr;
//    self.clMgr.delegate = self;
//    self.clMgr.desiredAccuracy = kCLLocationAccuracyBest;
//    self.clMgr.activityType = CLActivityTypeFitness;
//
//    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
//        [clMgr requestAlwaysAuthorization];
//    }
//////
//    // 开始
//    clMgr.pausesLocationUpdatesAutomatically = YES;
//    [clMgr startMonitoringVisits];
//    [clMgr startMonitoringSignificantLocationChanges];
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *mapView = [[MAMapView alloc] init];
    mapView.delegate = self;
    self.mapView = mapView;
    self.mapView.allowsBackgroundLocationUpdates = YES;
    ///把地图添加至view
    [self.view addSubview:mapView];
    
    self.userCollectViewLayout = [[UICollectionViewFlowLayout alloc] init];
    self.userCollectViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.userCollectViewLayout.itemSize = CGSizeMake(60, 107);
    self.userCollectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.userCollectViewLayout];
    self.userCollectView.dataSource = self;
    self.userCollectView.delegate = self;
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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.clMgr startUpdatingLocation];
    
    [self.mapView setCompassOrigin:CGPointMake(0,self.mapView.height - 60)];
    [self.mapView setShowsCompass:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"开始定位了");
        [self.mapView setShowsUserLocation:YES];
    });
}


/**
 绘制用户走过的轨迹
 */
- (void)drawTraceLine{
    
}

- (NSArray *)userList{
    if (!_userList) {
        _userList = [NSMutableArray array];
        
        {
            ZYUserModel *u = [ZYUserModel new];
            u.name = @"添加";
            u.userid = @"0";
            u.avater = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"add_person" ofType:@"png"]].absoluteString;
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // 点击添加话就去显示添加用户界面
    ZYUserModel *m = [self.userList objectAtIndex:indexPath.row];
    if ([m.userid isEqualToString:@"0"]) {
        //
        
        TestTableViewController *tvc = [[TestTableViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
    }
    
    // 点击自己 显示自己的定位
    
    // 点击用户 去显示用户 位置
}
#pragma mark - AMap Delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
    CLLocation *lastLocation = [locations lastObject];
    [self.mapView setZoomLevel:19 animated:YES];
    [self.mapView setCenterCoordinate:lastLocation.coordinate];
}

- (void)mapViewWillStartLoadingMap:(MAMapView *)mapView{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
}

- (void)mapViewDidFinishLoadingMap:(MAMapView *)mapView{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
    self.mapLoaded = YES;
}

- (void)mapInitComplete:(MAMapView *)mapView{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
}
- (void)mapViewDidFailLoadingMap:(MAMapView *)mapView withError:(NSError *)error{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
    self.mapLoaded = NO;
}

- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction{
    if (wasUserAction) {
        NSLog(@"被放大了");
    }
}
//
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if (error.code == kCLAuthorizationStatusDenied) {
        [self.clMgr stopMonitoringVisits];

        NSLog(@" 没有授权 ,请授权");
        return;
    }
}

- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
}

- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
}

/**
 * @brief 位置或者设备方向更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 用户定位信息(包括位置与设备方向等数据)
 * @param updatingLocation 标示是否是location数据更新, YES:location数据更新 NO:heading数据更新
 */
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
    ZYLoc *loc = [ZYLoc new];
    loc.latitude = userLocation.location.coordinate.latitude;
    loc.longitude = userLocation.location.coordinate.longitude;
    loc.desc = @"高德 前台数据";
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:loc];
    }];
}

/**
 * @brief 定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"__func__%s--thread=%@",__func__,[NSThread currentThread]);
}


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
