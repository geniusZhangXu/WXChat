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

@interface ZXTableViewController ()

@property(nonatomic,strong) NSArray * dataArray;

@end

@implementation ZXTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //  =======  关于注册cell  如果使用XIB写的话就用 NIB 注册  用纯代码创建的话就用 Class 注册， Sroryboard 没有 NIB 文件
    
    // [self.tableView registerNib:[UINib nibWithNibName:@"ZXTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZXidentifier"];
    
    // [self.tableView  registerClass:[ZXTableViewCell class] forCellReuseIdentifier:@"ZXidentifier"];

     _dataArray= @[@"张旭1",@"张旭2",@"张旭3",@"张旭4",@"张旭5"];

}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZXidentifier" ];
    if(!cell){
    
        cell=[[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZXidentifier"];
    
    }
    
    NSString * name = _dataArray[indexPath.row];
    cell.nameLabel.text=name;
    return cell;
    
}

#pragma mark  cell 点击界面之间的传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZXTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [XYDJViewController buttonTag:  cell.nameLabel.text];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end
