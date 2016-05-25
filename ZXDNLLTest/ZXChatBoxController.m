//
//  ZXChatBoxController.m
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "ZXChatBoxController.h"

@interface ZXChatBoxController ()<ZXChatBoxMoreViewDelegate,ZXChatBoxFaceViewDelegate,ZXChatBoxDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, assign) CGRect keyboardFrame;
@property (nonatomic, strong) ZXChatBoxView *chatBox;
@property (nonatomic, strong) ZXChatBoxMoreView *chatBoxMoreView;
@property (nonatomic, strong) ZXChatBoxFaceView *chatBoxFaceView;

@end

@implementation ZXChatBoxController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.chatBox];
    /**
     *  添加两个键盘回收通知
     */
    // 即将隐藏
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // 键盘的Frame值即将发生变化的时候创建的额监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self resignFirstResponder];
}

#pragma mark - Public Methods
/**
 *  回收键盘方法
 *  @return
 */
- (BOOL) resignFirstResponder
{
    
    if (self.chatBox.status != TLChatBoxStatusNothing && self.chatBox.status != TLChatBoxStatusShowVoice)
    {
        // 回收键盘
        [self.chatBox resignFirstResponder];
        /**
         *  在外层已经判断是不是声音状态 和 Nothing 状态了，且判断是都不是才进来的，下面在判断是否多余了？
         *  它是判断是不是要设置成Nothing状态
         */
        self.chatBox.status = (self.chatBox.status == TLChatBoxStatusShowVoice ? self.chatBox.status : TLChatBoxStatusNothing);
        
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)])
        {
            [UIView animateWithDuration:0.3 animations:^{
                
                [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight];
                
            } completion:^(BOOL finished) {
                
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
                
            }];
        }
    }
    
    return [super resignFirstResponder];
}


#pragma mark - TLChatBoxDelegate
/**
 *  发送消息调用这个代理方法
 *
 *  @param chatBox     <#chatBox description#>
 *  @param textMessage 发送的消息
 */
- (void) chatBox:(ZXChatBoxView *)chatBox sendTextMessage:(NSString *)textMessage
{
    
    ZXMessageModel *message = [[ZXMessageModel alloc] init];
    message.messageType = ZXMessageTypeText;
    message.ownerTyper = ZXMessageOwnerTypeSelf;
    message.text = textMessage;
    message.date = [NSDate date];
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController: sendMessage:)]) {
        
        [_delegate chatBoxViewController:self sendMessage:message];
        
    }
}

- (void)chatBox:(ZXChatBoxView *)chatBox changeChatBoxHeight:(CGFloat)height
{
    self.chatBoxFaceView.originY = height;
    self.chatBoxMoreView.originY = height;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)])
    {
        // 改变 控制器高度
        float h = (self.chatBox.status == TLChatBoxStatusShowFace ? HEIGHT_CHATBOXVIEW : self.keyboardFrame.size.height ) + height;
        
        [_delegate chatBoxViewController:self didChangeChatBoxHeight: h];
    }
}


/**
 *  代理方法，传递状态改变要显示那个view
 *
 *  @param chatBox
 *  @param fromStatus 开始状态
 *  @param toStatus   改变到这个状态
 */
- (void) chatBox:(ZXChatBoxView *)chatBox changeStatusForm:(ZXChatBoxStatus)fromStatus to:(ZXChatBoxStatus)toStatus
{
    
    if (toStatus == TLChatBoxStatusShowKeyboard) {      // 显示键盘 删除FaceView 和 MoreView
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.chatBoxFaceView removeFromSuperview];
            [self.chatBoxMoreView removeFromSuperview];
            
        });
        
        return;
    }
    else if (toStatus == TLChatBoxStatusShowVoice)
    {
        // 显示语音输入按钮
        // 从显示更多或表情状态 到 显示语音状态需要动画
        if (fromStatus == TLChatBoxStatusShowMore || fromStatus == TLChatBoxStatusShowFace) {
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:HEIGHT_TABBAR];
                    
                }
            } completion:^(BOOL finished) {
                
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        }
        else {
            
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:HEIGHT_TABBAR];
                }
            }];
        }
    }
    else if (toStatus == TLChatBoxStatusShowFace)
    {
        /**
         *   变化到展示 表情View 的状态，这个过程中，根据 fromStatus 区分，要是是声音和无状态改变过来的，则高度变化是一样的。 其他的高度就是另外一种，根据 fromStatus 来进行一个区分。
         */
        if (fromStatus == TLChatBoxStatusShowVoice || fromStatus == TLChatBoxStatusNothing) {
            
            [self.chatBoxFaceView setOriginY:self.chatBox.curHeight];
            // 添加表情View
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                }
            }];
        }
        else {
            // 表情高度变化
            self.chatBoxFaceView.originY = self.chatBox.curHeight + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxFaceView.originY = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxMoreView removeFromSuperview];
            }];
            // 整个界面高度变化
            if (fromStatus != TLChatBoxStatusShowMore) {
                
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                    }
                }];
            }
        }
    }
    else if (toStatus == TLChatBoxStatusShowMore)
    {
        // 显示更多面板
        if (fromStatus == TLChatBoxStatusShowVoice || fromStatus == TLChatBoxStatusNothing) {
            [self.chatBoxMoreView setOriginY:self.chatBox.curHeight];
            [self.view addSubview:self.chatBoxMoreView];
            
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                }
            }];
        }
        else {
            
            self.chatBoxMoreView.originY = self.chatBox.curHeight + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxMoreView.originY = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
            }];
            
            if (fromStatus != TLChatBoxStatusShowFace) {
                
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                    }
                }];
            }
        }
    }
}

#pragma mark - TLChatBoxFaceViewDelegate
- (void) chatBoxFaceViewDidSelectedFace:(ChatFace *)face type:(TLFaceType)type
{
    if (type == TLFaceTypeEmoji) {
        [self.chatBox addEmojiFace:face];
    }
}

- (void) chatBoxFaceViewDeleteButtonDown
{
    
    [self.chatBox deleteButtonDown];
    
}

- (void) chatBoxFaceViewSendButtonDown
{
    
    [self.chatBox sendCurrentMessage];
    
}


#pragma mark - TLChatBoxMoreViewDelegate
- (void) chatBoxMoreView:(ZXChatBoxMoreView *)chatBoxMoreView didSelectItem:(TLChatBoxItem)itemType
{
    if (itemType == TLChatBoxItemAlbum) {            // 相册
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }
    else if (itemType == TLChatBoxItemCamera) {       // 拍摄
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];//初始化
            [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            [imagePicker setDelegate:self];
            [self presentViewController:imagePicker animated:YES completion:^{
                
            }];
        }
        else {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前设备不支持拍照。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"Did Selected Index Of ChatBoxMoreView: %d", (int)itemType] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

/**
 *
 *
 *  @return 从相册读取图片的回调方法
 */
#pragma mark - UIImagePickerControllerDelegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *imageName = [NSString stringWithFormat:@"%lf", [[NSDate date]timeIntervalSince1970]];
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", PATH_CHATREC_IMAGE, imageName];
    NSData *imageData = (UIImagePNGRepresentation(image) == nil ? UIImageJPEGRepresentation(image, 1) : UIImagePNGRepresentation(image));
    [[NSFileManager defaultManager] createFileAtPath:imagePath contents:imageData attributes:nil];
    
    ZXMessageModel *message = [[ZXMessageModel alloc] init];
    message.messageType = ZXMessageTypeImage;
    message.ownerTyper = ZXMessageOwnerTypeSelf;
    message.date = [NSDate date];
    message.imagePath = imageName;
    
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:sendMessage:)]) {
        [_delegate chatBoxViewController:self sendMessage:message];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Getter
- (ZXChatBoxView *) chatBox
{
    // 6 的初始化 0.0.375.49
    if (_chatBox == nil) {
        _chatBox = [[ZXChatBoxView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_TABBAR)];
        [_chatBox setDelegate:self]; // 0 0 宽 49
    }
    
    return _chatBox;
    
}

// 添加创建更多View
- (ZXChatBoxMoreView *) chatBoxMoreView
{
    if (_chatBoxMoreView == nil) {
        _chatBoxMoreView = [[ZXChatBoxMoreView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        // [_chatBoxMoreView setDelegate:self];
        
        ZXChatBoxItemView *photosItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"照片"
                                                                                imageName:@"sharemore_pic"];
        ZXChatBoxItemView *takePictureItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"拍摄"
                                                                                     imageName:@"sharemore_video"];
        ZXChatBoxItemView *videoItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"小视频"
                                                                               imageName:@"sharemore_sight"];
        ZXChatBoxItemView *videoCallItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"视频聊天"
                                                                                   imageName:@"sharemore_videovoip"];
        ZXChatBoxItemView *giftItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"红包"
                                                                              imageName:@"sharemore_wallet"];
        ZXChatBoxItemView *transferItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"转账"
                                                                                  imageName:@"sharemorePay"];
        ZXChatBoxItemView *positionItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"位置"
                                                                                  imageName:@"sharemore_location"];
        ZXChatBoxItemView *favoriteItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"收藏"
                                                                                  imageName:@"sharemore_myfav"];
        ZXChatBoxItemView *businessCardItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"名片"
                                                                                      imageName:@"sharemore_friendcard" ];
        ZXChatBoxItemView *interphoneItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"实时对讲机"
                                                                                    imageName:@"sharemore_wxtalk" ];
        ZXChatBoxItemView *voiceItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"语音输入"
                                                                               imageName:@"sharemore_voiceinput"];
        ZXChatBoxItemView *cardsItem = [ZXChatBoxItemView createChatBoxMoreItemWithTitle:@"卡券"
                                                                               imageName:@"sharemore_wallet"];
        [_chatBoxMoreView setItems:[[NSMutableArray alloc] initWithObjects:photosItem, takePictureItem, videoItem, videoCallItem, giftItem, transferItem, positionItem, favoriteItem, businessCardItem, interphoneItem, voiceItem, cardsItem, nil]];
    }
    return _chatBoxMoreView;
}


-(ZXChatBoxFaceView *) chatBoxFaceView
{
    if (_chatBoxFaceView == nil) {
        _chatBoxFaceView = [[ZXChatBoxFaceView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        [_chatBoxFaceView setDelegate:self];
    }
    return _chatBoxFaceView;
}

/**
 *   在控制器里面添加键盘的监听，
 *
 *  @return <#return value description#>
 */
#pragma mark - Private Methods
- (void)keyboardWillHide:(NSNotification *)notification{
    self.keyboardFrame = CGRectZero;
    if (_chatBox.status == TLChatBoxStatusShowFace || _chatBox.status == TLChatBoxStatusShowMore) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        
        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight];
    }
}

/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。
 
 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{
    
    // 键盘的Frame
    // po self.keyboardFrame 第一次点击 textview 的时候的值
    // (origin = (x = 0, y = 409), size = (width = 375, height = 258))
    // po self.chatBox.curHeight   49

    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (_chatBox.status == TLChatBoxStatusShowKeyboard && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        
        return;
        
    }
    else if ((_chatBox.status == TLChatBoxStatusShowFace || _chatBox.status == TLChatBoxStatusShowMore) && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        
        return;
        
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
       
        // 改变控制器.View 的高度 键盘的高度 + 当前的 49
        [_delegate chatBoxViewController:self didChangeChatBoxHeight: self.keyboardFrame.size.height + self.chatBox.curHeight];
        
    }
}

- (void)dealloc{
    
    /**
     *  移除键盘通知
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
