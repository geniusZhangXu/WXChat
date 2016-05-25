//
//  ZXChatBoxController.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXChatBoxView.h"
#import "ZXChatBoxFaceView.h"
#import "ZXChatBoxMoreView.h"
#import "ZXMessageModel.h"
@class ZXChatBoxController;

@protocol ZXChatBoxViewControllerDelegate <NSObject>

- (void)chatBoxViewController:(ZXChatBoxController *)chatboxViewController
        didChangeChatBoxHeight:(CGFloat)height;

- (void) chatBoxViewController:(ZXChatBoxController *)chatboxViewController
                   sendMessage:(ZXMessageModel *)message;

@end

@interface ZXChatBoxController : UIViewController

@property id<ZXChatBoxViewControllerDelegate>delegate;


@end
