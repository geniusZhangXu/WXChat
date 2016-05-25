//
//  TLUserHelper.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLUserHelper.h"

static TLUserHelper *userHelper = nil;

@implementation TLUserHelper

+ (TLUserHelper *)sharedUserHelper
{
    if (userHelper == nil) {
        userHelper = [[TLUserHelper alloc] init];
    }
    return userHelper;
}

- (TLUser *) user
{
    if (_user == nil) {
        _user = [[TLUser alloc] init];
        _user.username = @"Bay、栢";// 名字
        _user.userID = @"li-bokun";// ID
        _user.avatarURL = @"0.jpg";// 图片
    }
    return _user;
}

@end
