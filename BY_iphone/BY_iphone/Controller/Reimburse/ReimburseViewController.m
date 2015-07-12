//
//  ReimburseViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ReimburseViewController.h"

@interface ReimburseViewController ()

@end

@implementation ReimburseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"日常报销";
    [self setupView];
    // Do any additional setup after loading the view from its nib.
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
-(void)setupView
{
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [NSObject setExtraCellLineHidden:self.tableview];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    __weak typeof(self) weakSelf = self;
//    AppleListCell *cell=[tableView dequeueReusableCellWithIdentifier:@"AppleListCell"];
//    if(cell==nil){
//        cell = (AppleListCell*)[[self.AppleListNib instantiateWithOwner:self options:nil] objectAtIndex:0];
//        
//    }
//    cell.iconimage.image = [UIImage imageNamed:self.items[indexPath.row][@"icon"]];
//    cell.titlelab.text = self.items[indexPath.row][@"title"];
//    if (indexPath.row == 2 ||indexPath.row == 3) {
//        cell.arrowimage.image = [UIImage imageNamed:@"btn_right_hl.png"];
//    }
//    else
//    {
//        cell.arrowimage.image = [UIImage imageNamed:@"btn_right.png"];
//    }
//    [cell setupBadgeView:@"111"];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
@end
