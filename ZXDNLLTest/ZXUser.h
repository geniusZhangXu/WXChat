//
//  ZXUser.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/19.
//  Copyright © 2016年 mxsm. All rights reserved.
//

// 好友列表 Model
#import <Foundation/Foundation.h>

@interface ZXUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nikename;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, strong) NSString *initial;


@end
