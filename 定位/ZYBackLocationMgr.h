//
//  ZYLocationMgr.h
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
/**
 后台定位管理类
 */
@interface ZYBackLocationMgr : CLLocationManager
+ (instancetype)shareLocMgr;

@property (nonatomic, assign) CGFloat minSpeed;
@property (nonatomic, assign) CGFloat minFilter;
@property (nonatomic, assign) CGFloat minInteval;
@end
