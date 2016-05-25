//
//  ZXChatBoxItemView.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/20.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXChatBoxItemView : UIView


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;

+ (ZXChatBoxItemView *) createChatBoxMoreItemWithTitle:(NSString *)title
                                             imageName:(NSString *)imageName;

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
