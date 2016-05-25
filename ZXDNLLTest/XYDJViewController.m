//
//  XYDJViewController.m
//  StoryboardTest
//
//  Created by mxsm on 16/4/18.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "XYDJViewController.h"

@interface XYDJViewController ()

@end

@implementation XYDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  国际化
    NSString * _morning = NSLocalizedString(@"GOOD_morning", nil);
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    label.text = _morning;
    label.textColor=[UIColor redColor];
    [self.view addSubview:label];
    
    
//    // 先看看Plist里面有什么， 其实它只是创建了，没写数据，是空的！
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"ZXPropertyList" ofType:@"plist"];
//    NSMutableDictionary * dataC=[[NSMutableDictionary alloc]initWithContentsOfFile:path];
//    NSLog(@"%@",dataC);
//    
//    // 写一条数据进去
//    /*
//     我自己的经验，这个plist 文件写我们经常用到的省市区的三级分类数据还是很好用的！至于这个三级分类的数据格式，自己理一下。
//     这里是增加，还有删除，修改这些都是一个道理，你读取出来了，修改字典里面相应的内容，再重新存储进去就可以了！
//     */
//    [dataC setObject:@"小旭" forKey:@"c_name"];
//   
//    // 获取完整的Plist 路径
//    // 说说 stringByAppendingPathComponent 这个方法，它其实就是拼接一下路径，把前面读物到的沙盒路径和后面的 plist 的路径拼接成一个完整的路径返回！
//    NSArray * pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);    
//    [dataC writeToFile:[pathArray[0] stringByAppendingPathComponent:@"ZXPropertyList.plist"] atomically:YES];
//    
//    // 在读取看数据是不是写入了
//    NSString * fielname = [pathArray[0] stringByAppendingPathComponent:@"ZXPropertyList.plist"];
//    NSMutableDictionary * _dataC=[[NSMutableDictionary alloc]initWithContentsOfFile:fielname];
//    NSLog(@"%@",_dataC);
//    
//    
    
}

+(void)buttonTag:(id)sender
{
    NSLog(@"%@",sender);
    
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
