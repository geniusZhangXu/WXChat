//
//  zxWebViewController.m
//  StoryboardTest
//
//  Created by mxsm on 16/4/13.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "zxWebViewController.h"

@interface zxWebViewController ()

@end

@implementation zxWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_ZXwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
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
