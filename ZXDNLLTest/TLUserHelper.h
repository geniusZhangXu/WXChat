//
//  TLUserHelper.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXUser.h"

@interface TLUserHelper : NSObject

@property (nonatomic, strong) ZXUser *user;

+ (TLUserHelper *)sharedUserHelper;

@end
