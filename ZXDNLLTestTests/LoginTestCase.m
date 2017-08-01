//
//  LoginTestCase.m
//  ZXDNLLTest
//
//  Created by mxsm on 16/4/28.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "LoginTestCase.h"
#import "AFNetworking.h"
@implementation LoginTestCase

/*
 beforeAll 是一个在所有测试运行之前被调用一次的特殊方法。你可以为你这里运行的测试设置任何实体变量和初始化条件.
 tester 对象是指定的 KIFUITestActor 类的一个缩略名称。这个类包含了模拟用户动作的方法，包括触摸和滑动.
 tapViewWithAccessibilityLabel 这也许是最常被用到的测试动作方法。正如其名称所显示的，它可以在给定的辅助标签模拟在视图上的触击。在大多数情况下，辅助标签和可视的文本标签（例如按钮组件）是配套的。否则你就需要手动设置辅助标签.
 一些控件，诸如 UISwitch，更加复杂，需要比简单的触击更复杂的步骤来触发。 KIF 提供了一个特殊的 setOn:forSwitchWithAccessibilityLabel: 方法来改变一个切换的状态.
*/

- (void)beforeAll {
    ////
//    [tester tapViewWithAccessibilityLabel:@"Settings"];
//    [tester setOn:YES forSwitchWithAccessibilityLabel:@"Debug Mode"];
//    [tester tapViewWithAccessibilityLabel:@"Clear History"];
//    [tester tapViewWithAccessibilityLabel:@"Clear"];
    
}

//  这里的测试方法使用 test开头的，后面的自己写，你要用command+U 的形式运行的话，它的运行的顺序就是除了test之外的后面的按字母排序的方式运行，比如下面的这个方法，出test之外第一个字母是Z，你要是又命名一个方法，testyou ,它是y ，他就会先运行。当然你也可以一个方法一个方法的运行，点击方法前面的框框就OK了！

-(void)testzhangxuone
{
//    // 可以在这里添加自己需要的测试的内容！
//    int a = 0;
//    if (a==0) {
//        NSLog(@"you are successful");
//        
//    }
}

/* 
    下面是在简书找到的一篇关于单元测试的一个网络请求的测试，其实大家可以对比一下KIF ！！！
    KIF和苹果自带的UI测试两者本质是一样的！
    不过下面的请求是   AFNetworking 3.0 以前的版本的，大家用还是用3.0之后的吧！
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    关于3.0 之后的给大家一个连接，可以去看看！====== http://www.jianshu.com/p/047463a7ce9b

*/

//   下面方法的原文链接  ============= http://www.jianshu.com/p/8bbec078cabe

//-(void)testRequest{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
//    // 2.发送GET请求
//    [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"responseObject:%@",responseObject);
//        XCTAssertNotNil(responseObject, @"返回出错");
//        self.stAlertView = [[STAlertView alloc]initWithTitle:@"验证码" message:nil textFieldHint:@"请输入手机验证码" textFieldValue:nil cancelButtonTitle:@"取消" otherButtonTitle:@"确定" cancelButtonBlock:^{
//            //点击取消返回后执行
//            [self testAlertViewCancel];
//            NOTIFY //继续执行
//        } otherButtonBlock:^(NSString *b) {
//            //点击确定后执行
//            [self alertViewComfirm:b];
//            NOTIFY //继续执行
//        }];
//        [self.stAlertView show];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error:%@",error);
//        XCTAssertNil(error, @"请求出错");
//        NOTIFY //继续执行
//    }];
//    WAIT  //暂停
//}

@end
