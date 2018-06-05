//
//  ZYUserCollectionViewCell.m
//  定位
//
//  Created by zhangyun on 2018/6/5.
//  Copyright © 2018年 zy. All rights reserved.
//

#import "ZYUserCollectionViewCell.h"
#import <Masonry.h>
#import <YYKit.h>

@implementation ZYUserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.userHeader = [[UIImageView alloc] init];
    self.userName = [[UILabel alloc] init];
    [self.contentView addSubview:self.userHeader];
    [self.contentView addSubview:self.userName];
    self.userName.font = [UIFont systemFontOfSize:15];
    [self.userHeader setContentMode:UIViewContentModeScaleAspectFit];
    
    self.userHeader.clipsToBounds = YES;
    self.userHeader.layer.cornerRadius = 30;
    
    self.userName.textAlignment = NSTextAlignmentCenter;
    
    [self.userHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(self.userHeader.mas_width);
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.userHeader);
        make.top.equalTo(self.userHeader.mas_bottom).offset(5);
    }];
}

- (void)setHeader:(NSString *)header name:(NSString *)name{
    UIImage *placeHodler = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user_default" ofType:@"png"]];
    [self.userHeader setImageWithURL:[NSURL URLWithString:header] placeholder:placeHodler];
    [self.userName setText:name];
}
@end
