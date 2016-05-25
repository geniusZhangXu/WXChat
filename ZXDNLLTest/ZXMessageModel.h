//
//  ZXMessageModel.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ZXUserModel.h"
#import "ZXUser.h"
/**
 *  消息拥有者
 */
typedef NS_ENUM(NSUInteger, ZXMessageOwnerType){
    ZXMessageOwnerTypeUnknown,  // 未知的消息拥有者
    ZXMessageOwnerTypeSystem,   // 系统消息
    ZXMessageOwnerTypeSelf,     // 自己发送的消息
    ZXMessageOwnerTypeOther,    // 接收到的他人消息
};

/**
 *  消息类型
 */
typedef NS_ENUM(NSInteger, ZXMessageType){
    ZXMessageTypeUnknown,       // 未知
    ZXMessageTypeSystem,        // 系统
    ZXMessageTypeText,          // 文字
    ZXMessageTypeImage,         // 图片
    ZXMessageTypeVoice,         // 语音
    ZXMessageTypeVideo,         // 视频
    ZXMessageTypeFile,          // 文件
    ZXMessageTypeLocation,      // 位置
    ZXMessageTypeShake,         // 抖动
};

/**
 *  消息发送状态
 */
typedef NS_ENUM(NSUInteger, ZXMessageSendState){
    ZXMessageSendSuccess,       // 消息发送成功
    ZXMessageSendFail,          // 消息发送失败
};

/**
 *  消息读取状态
 */
typedef NS_ENUM(NSUInteger, ZXMessageReadState) {
    
    ZXMessageUnRead,            // 消息未读
    ZXMessageReaded,            // 消息已读
    
};

@interface ZXMessageModel : NSObject

@property (nonatomic, strong) ZXUser *from;                    // 发送者信息
@property (nonatomic, strong) NSDate *date;                         // 发送时间
@property (nonatomic, strong) NSString *dateString;                 // 格式化的发送时间
@property (nonatomic, assign) ZXMessageType messageType;            // 消息类型
@property (nonatomic, assign) ZXMessageOwnerType ownerTyper;        // 发送者类型
@property (nonatomic, assign) ZXMessageReadState readState;         // 读取状态
@property (nonatomic, assign) ZXMessageSendState sendState;         // 发送状态

@property (nonatomic, assign) CGSize messageSize;                   // 消息大小
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSString *cellIndentify;

#pragma mark - 文字消息
@property (nonatomic, strong) NSString *text;                       // 文字信息
@property (nonatomic, strong) NSAttributedString *attrText;         // 格式化的文字信息

#pragma mark - 图片消息
@property (nonatomic, strong) NSString *imagePath;                  // 本地图片Path
@property (nonatomic, strong) UIImage *image;                       // 图片缓存
@property (nonatomic, strong) NSString *imageURL;                   // 网络图片URL

#pragma mark - 位置消息
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;    // 经纬度
@property (nonatomic, strong) NSString *address;                    // 地址

#pragma mark - 语音消息
@property (nonatomic, assign) NSUInteger voiceSeconds;              // 语音时间
@property (nonatomic, strong) NSString *voiceUrl;                   // 网络语音URL
@property (nonatomic, strong) NSString *voicePath;                  // 本地语音Path

@end
