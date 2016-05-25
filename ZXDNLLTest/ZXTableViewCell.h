//
//  ZXTableViewCell.h
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/17.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "ZXUserModel.h"
@interface ZXTableViewCell : CommonTableViewCell

@property(nonatomic,strong) ZXUserModel * userModel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@end
