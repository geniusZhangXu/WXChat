//
//  ZXChatFaceMenuView.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/20.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatFace.h"

@class ZXChatFaceMenuView;

@protocol ZXChatBoxFaceMenuViewDelegate <NSObject>
/**
 *  表情菜单界面的添加按钮点击事件
 */
- (void) chatBoxFaceMenuViewAddButtonDown;
/**
 *  发送事件
 */
- (void) chatBoxFaceMenuViewSendButtonDown;


- (void) chatBoxFaceMenuView:(ZXChatFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index;

@end

@interface ZXChatFaceMenuView : UIView

@property (nonatomic, assign) id<ZXChatBoxFaceMenuViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray *faceGroupArray;

@end
