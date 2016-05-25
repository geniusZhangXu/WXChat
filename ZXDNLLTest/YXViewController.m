//
//  YXViewController.m
//  StoryboardTest
//
//  Created by mxsm on 16/4/13.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "YXViewController.h"

@interface YXViewController ()

@end

@implementation YXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_YXString);
    
}


- (IBAction)PopController:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
