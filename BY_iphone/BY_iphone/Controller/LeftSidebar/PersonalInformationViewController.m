//
//  PersonalInformationViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalinfoCell.h"
@interface PersonalInformationViewController ()
@property UINib* PersonalinfoNib;
@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupView
{
    self.items = @[@"员工姓名",@"Employee编号",@"电子邮件",@"所属公司代码",@"成本中心代码"];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    //    [NSObject setExtraCellLineHidden:self.tableview];
    self.PersonalinfoNib = [UINib nibWithNibName:@"PersonalinfoCell" bundle:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalinfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PersonalinfoCell"];
    if(cell==nil){
        cell = (PersonalinfoCell*)[[self.PersonalinfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }

    cell.titlelab.text = self.items[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
    
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
