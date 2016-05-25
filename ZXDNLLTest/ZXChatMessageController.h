//
//  ZXChatMessageController.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXMessageModel.h"
///
@class ZXChatMessageController;
@protocol ZXChatMessageControllerDelegate <NSObject>

- (void) didTapChatMessageView:(ZXChatMessageController *)chatMessageViewController;

@end

@interface ZXChatMessageController : UITableViewController

@property (nonatomic,strong) id <ZXChatMessageControllerDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *data;

/**
 *  改变数据源方法，添加一条消息，刷新数据
 *
 *  @param message 添加的消息
 */
- (void) addNewMessage:(ZXMessageModel *)message;

/**
 *   添加一条消息就让tableView滑动
 */
- (void) scrollToBottom;


@end
