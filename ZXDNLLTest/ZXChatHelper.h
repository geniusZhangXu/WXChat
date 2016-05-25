//
//  ZXChatHelper.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXChatHelper : NSObject

@property (nonatomic, strong) NSMutableArray *faceGroupArray;


+ (NSAttributedString *) formatMessageString:(NSString *)text;

@end
