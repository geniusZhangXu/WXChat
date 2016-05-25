//
//  ChatFaceHeleper.m
//  ZXDNLLTest
//
//  Created by mxsm on 16/5/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "ChatFaceHeleper.h"
#import "ChatFace.h"
static ChatFaceHeleper * faceHeleper = nil;

@implementation ChatFaceHeleper

+(ChatFaceHeleper * )sharedFaceHelper
{
    if (!faceHeleper) {
        
        faceHeleper = [[ChatFaceHeleper alloc]init];
        
    }
    
    return  faceHeleper;
}

/**
 *   通过这个方法，从  plist 文件中取出来表情
 */
#pragma mark - Public Methods
- (NSArray *) getFaceArrayByGroupID:(NSString *)groupID
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:groupID ofType:@"plist"]];
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *dic in array) {
        ChatFace *face = [[ChatFace alloc] init];
        face.faceID = [dic objectForKey:@"face_id"];
        face.faceName = [dic objectForKey:@"face_name"];
        [data addObject:face];
    }
    
    return data;
}

#pragma mark -  ChatFaceGroup Getter
- (NSMutableArray *) faceGroupArray
{
    
    if (_faceGroupArray == nil) {
        _faceGroupArray = [[NSMutableArray alloc] init];
        
        ChatFaceGroup *group = [[ChatFaceGroup alloc] init];
        group.faceType = TLFaceTypeEmoji;
        group.groupID = @"normal_face";
        group.groupImageName = @"EmotionsEmojiHL";
        group.facesArray = nil;
        [_faceGroupArray addObject:group];
    }
    return _faceGroupArray;
}

@end
