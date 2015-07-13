//
//  ReimbursDetailViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/13.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ReimbursDetailViewController.h"
#import "ReimbuseSKSCell.h"
#import "ReimbuseSKSSubCell.h"

@interface ReimbursDetailViewController ()
@property (nonatomic, strong) NSArray *contents;
@property UINib* ReimbuseSKSNib;
@property UINib* ReimbuseSKSSubNib;
@end

@implementation ReimbursDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报销明细";
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{
    self.tableView.SKSTableViewDelegate = self;
    self.ReimbuseSKSNib = [UINib nibWithNibName:@"ReimbuseSKSCell" bundle:nil];
    self.ReimbuseSKSSubNib = [UINib nibWithNibName:@"ReimbuseSKSSubCell" bundle:nil];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}
- (BOOL)tableView:(SKSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return NO;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReimbuseSKSCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ReimbuseSKSCell"];
    if(cell==nil){
        cell = (ReimbuseSKSCell*)[[self.ReimbuseSKSNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    cell.titlelab.text = @"业务交通费";
    cell.pricelab.text = @"1423";
    cell.expandable = YES;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReimbuseSKSSubCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ReimbuseSKSSubCell"];
    if(cell==nil){
        cell = (ReimbuseSKSSubCell*)[[self.ReimbuseSKSSubNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    cell.firstLab.text = @"日期";
    cell.firstNameLab.text = @"2015-11-11";
    cell.secondLab.text = @"报销月份";
    cell.secondNameLab.text = @"2015-11";
    cell.thirdLab.text = @"票据张数";
    cell.thirdNmaeLab.text = @"1";
    cell.forthLab.text = @"补充说明";
    cell.forthNameLab.text = @"打车费用";
    cell.fifthLab.text = @"项目类型";
    cell.fifthNmaeLab.text = @"Backlog";
    cell.sixthLab.text = @"备注";
    cell.sixthNameLab.text = @"";
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(CGFloat)tableView:(SKSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
