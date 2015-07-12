//
//  ReimburseDetailViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ReimburseDetailViewController.h"

@interface ReimburseDetailViewController ()

@end

@implementation ReimburseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报销明细";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupView
{
    self.tableview.delegate = self;
    self.tableview.dataSource = self;

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //        __weak typeof(self) weakSelf = self;
//    FullSubInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FullSubInfoCell"];
//    if(cell==nil){
//        cell = (FullSubInfoCell*)[[self.FullSubInfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
//        
//    }
//    
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    return cell;
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)nextBtn:(UIButton*)sender
{
    DLog(@"下一步");
}
@end
