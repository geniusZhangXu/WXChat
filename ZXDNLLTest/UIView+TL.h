//
//  UIView+TL.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/17.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TL)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat frameRight;
@property (nonatomic, assign) CGFloat frameBottom;

@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;

- (BOOL) containsSubView:(UIView *)subView;
- (BOOL) containsSubViewOfClassType:(Class)aClass;

@end
