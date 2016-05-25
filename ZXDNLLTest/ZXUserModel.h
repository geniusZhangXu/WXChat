//
//  ZXUserModel.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/17.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXUserModel : NSObject

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int messageCount;
@property (nonatomic, strong) NSURL *avatarURL;

@end
