//
//  ZYUserAnnotationView.m
//  定位
//
//  Created by zhangyun on 2018/6/6.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "ZYUserAnnotationView.h"
#import <YYKit.h>

@implementation ZYUserAnnotationView

- (UIImageView *)avater{
    if (!_avater) {
        _avater = [[UIImageView alloc] initWithFrame:CGRectMake(12,11,33,33)];
        _avater.clipsToBounds = YES;
        _avater.layer.cornerRadius = 33/2;
    }
    return _avater;
}

- (void)setAvaterUrl:(NSString *)avater{
    if (avater.length == 0) {
        return;
    }
    
    NSURL *url;
    if ([avater isKindOfClass:[NSURL class]]) {
         url = (NSURL *)avater;
    }else{
        url = [NSURL URLWithString:avater];
    }
    [self.avater setImageWithURL:url placeholder:nil];
    if (self.avater.superview == nil) {
        [self.imageView addSubview:self.avater];
    }
}
@end
