//
//  ZYUserCollectionViewCell.h
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUserCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *userHeader;
@property (nonatomic,strong) UILabel *userName;

- (void)setHeader:(NSString *)header name:(NSString *)name;
@end
