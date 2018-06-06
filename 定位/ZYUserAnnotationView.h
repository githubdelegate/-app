//
//  ZYUserAnnotationView.h
//  定位
//
//  Created by zhangyun on 2018/6/6.
//  Copyright © 2018年 zy. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

@interface ZYUserAnnotationView : MAAnnotationView
@property (nonatomic,strong) UIImageView *avater;
- (void)setAvaterUrl:(NSString *)avater;
@end
