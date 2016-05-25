//
//  ZXMessageModel.m
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "ZXMessageModel.h"
#import "ZXChatHelper.h"

static UILabel *label = nil;

@implementation ZXMessageModel


-(id)init
{
    if (self = [super init]) {
        
        if (label == nil) {
            label = [[UILabel alloc] init];
            [label setNumberOfLines:0];
            [label setFont:[UIFont systemFontOfSize:16.0f]];
        }
    }
    
    return self;
}

#pragma mark - Setter
-(void) setText:(NSString *)text
{
    _text = text;
    if (text.length > 0) {
        
        _attrText = [ZXChatHelper formatMessageString:text];
        
    }
}

#pragma mark - Getter
- (void) setMessageType:(ZXMessageType)messageType
{
    
    _messageType = messageType;
    switch (messageType) {
        case ZXMessageTypeText:
            self.cellIndentify = @"ZXTextMessageCell";
            break;
        case ZXMessageTypeImage:
            self.cellIndentify = @"ZXImageMessageCell";
            break;
        case ZXMessageTypeVoice:
            self.cellIndentify = @"ZXVoiceMessageCell";
            break;
        case ZXMessageTypeSystem:
            self.cellIndentify = @"ZXSystemMessageCell";
            break;
        default:
            break;
    }
}


-(CGSize) messageSize
{
    
    switch (self.messageType) {
            
        case ZXMessageTypeText:
            [label setAttributedText:self.attrText];
            _messageSize = [label sizeThatFits:CGSizeMake(WIDTH_SCREEN * 0.58, MAXFLOAT)];
            break;
            
        case ZXMessageTypeImage:
        {
            NSString *path = [NSString stringWithFormat:@"%@/%@", PATH_CHATREC_IMAGE, self.imagePath];
            _image = [UIImage imageNamed:path];
            if (_image != nil) {
                _messageSize = (_image.size.width > WIDTH_SCREEN * 0.5 ? CGSizeMake(WIDTH_SCREEN * 0.5, WIDTH_SCREEN * 0.5 / _image.size.width * _image.size.height) : _image.size);
                _messageSize = (_messageSize.height > 60 ? (_messageSize.height < 200 ? _messageSize : CGSizeMake(_messageSize.width, 200)) : CGSizeMake(60.0 / _messageSize.height * _messageSize.width, 60));
            }
            else {
                _messageSize = CGSizeMake(0, 0);
            }
            break;
        }
        case ZXMessageTypeVoice:
            break;
            
        case ZXMessageTypeSystem:
            break;
            
        default:
            break;
    }
    
    return _messageSize;
}


-(CGFloat) cellHeight
{
    
    switch (self.messageType){
            // cell 上下间隔为10
        case ZXMessageTypeText:
            
            return self.messageSize.height + 40 > 60 ? self.messageSize.height + 40 : 60;
            break;
            
        case ZXMessageTypeImage:
            
            return self.messageSize.height + 20;
            break;
            
        default:
            
            break;
    }
    
    return 0;
}

@end
