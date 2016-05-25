//
//  ZXTableViewController.m
//  StoryboardTest
//
//  Created by mxsm on 16/4/12.
//  Copyright © 2016年 mxsm. All rights reserved.
//

#import "ZXTableViewController.h"
#import "ZXTableViewCell.h"
#import "XYDJViewController.h"
#import "ZXUserModel.h"
#import "ZXUser.h"
@interface ZXTableViewController ()

@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic,strong) XYDJViewController * chatVC;

@end

@implementation ZXTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArray = [self getTestData];
    
    /**
     *  你在注册cell 的时候其实就会调用 cell 的 init 方法，后面你下载好数据，在赋给cell
     */
    [self.tableView registerClass:[ZXTableViewCell class] forCellReuseIdentifier:@"ZXTableViewCell"];
    
}

#pragma mark - Private Methods
- (NSMutableArray *) getTestData
{
    
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:20];
    
    ZXUserModel *item1 = [[ZXUserModel alloc] init];
    item1.from = [NSString stringWithFormat:@"文小雨"];
    item1.message = @"帅哥你好！！";
    item1.avatarURL = [NSURL URLWithString:@"10.jpeg"];
    item1.messageCount = 0;
    item1.date = [NSDate date];
    [models addObject:item1];
    return models;
    
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /**
     *   使用 dequeueReusableCellWithIdentifier:@"ZXTableViewCell" forIndexPath 可以不判断是否为空，但必须的注册
         要是使用 dequeueReusableCellWithIdentifier 可以不注册，但必须得判断
     */
    
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZXTableViewCell" forIndexPath:indexPath];
    
    [cell setUserModel:_dataArray[indexPath.row]];
    
    return cell;
}

#pragma mark  cell 点击界面之间的传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
    /**
     *   点击消息列表，这里进入一个聊天消息详情的界面。
     */
    if (_chatVC == nil) {
        _chatVC = [[ XYDJViewController  alloc] init];
    }
    /**
     下面的这个 TLUser 就是具体到用户的一个数据 model
     */
    ZXUser *user7 = [[ZXUser alloc] init];
    user7.username = @"文小雨";
    user7.userID = @"XB";
    user7.nikename = @"小贝";
    user7.avatarURL = @"10.jpeg";
    _chatVC.user = user7;
    
    // 隐藏底部的buttomBar 当 push 的时候
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_chatVC animated:YES];
    /**
     * 不加下面此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
     加上此句，返回时直接就是非选中状态。
     */
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

-(UIView * )tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]init];
    return view;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
-(void) viewDidDisappear:(BOOL)animated
{
    /**
     *  显现tabbar
     */
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end
