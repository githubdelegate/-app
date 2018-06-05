//
//  ZYLoc.h
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Realm/Realm.h>
@interface ZYLoc : RLMObject
@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;
@property NSString *desc;
@end
