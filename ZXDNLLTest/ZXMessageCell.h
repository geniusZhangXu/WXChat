//
//  ZXMessageCell.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXMessageModel.h"

@interface ZXMessageCell : UITableViewCell

@property(nonatomic,strong) ZXMessageModel * messageModel;

/**
 *  其他的cell 继承与这个cell，这个cell中只有头像是共有的，就只写头像，其他的就在各自cell中去写。
 */
@property (nonatomic, strong) UIImageView *avatarImageView;                 // 头像
@property (nonatomic, strong) UIImageView *messageBackgroundImageView;      // 消息背景
@property (nonatomic, strong) UIImageView *messageSendStatusImageView;      // 消息发送状态

@end
