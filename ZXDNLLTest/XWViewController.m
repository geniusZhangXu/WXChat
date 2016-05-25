//
//  XWViewController.m
//  StoryboardTest
//
//  Created by mxsm on 16/4/13.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "XWViewController.h"
#import "YXViewController.h"
@interface XWViewController ()

@end

@implementation XWViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

}

//  UIStoryboard 界面之间的传值
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    if ([segue.identifier isEqualToString:@"ZXpush"]) {
        
        YXViewController  * controller = segue.destinationViewController;
        controller.YXString=@"张旭是天才";
        
    }
    
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
