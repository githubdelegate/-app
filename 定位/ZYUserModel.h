//
//  ZYUserModel.h
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ZYUserModel : NSObject
@property (nonatomic,strong) NSString *userid;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *avater;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,assign) CLLocation *location;

@end
