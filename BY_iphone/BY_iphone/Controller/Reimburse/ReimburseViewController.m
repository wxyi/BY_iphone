//
//  ReimburseViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ReimburseViewController.h"
#import "ReimbuseTopCell.h"
#import "ReimbuseSubCell.h"
#import "strokeCell.h"
#import "ReimbursDetailViewController.h"
#import "ApprovalProcessViewController.h"
@interface ReimburseViewController ()<UITextFieldDelegate>
@property UINib* ReimbuseTopNib;
@property UINib* ReimbuseSubNib;
@property UINib* strokeNib;
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
    self.ReimbuseTopNib = [UINib nibWithNibName:@"ReimbuseTopCell" bundle:nil];
    self.ReimbuseSubNib = [UINib nibWithNibName:@"ReimbuseSubCell" bundle:nil];
    self.strokeNib = [UINib nibWithNibName:@"strokeCell" bundle:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//        __weak typeof(self) weakSelf = self;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ReimbuseTopCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ReimbuseTopCell"];
            if(cell==nil){
                cell = (ReimbuseTopCell*)[[self.ReimbuseTopNib instantiateWithOwner:self options:nil] objectAtIndex:0];
                
            }
            cell.nameLab.text = @"武新义";
            cell.nameCardLab.text = @"70008733";
            cell.costcenterLab.text = @"运营管理部BJ";
            cell.costcenterCardLab.text = @"0002020401";
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
        else
        {
            ReimbuseSubCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ReimbuseSubCell"];
            if(cell==nil){
                cell = (ReimbuseSubCell*)[[self.ReimbuseSubNib instantiateWithOwner:self options:nil] objectAtIndex:0];
                
            }
            
            if (indexPath.row == 1) {
                cell.firstLab.text = @"银行";
                cell.firstNameLab.text = @"建设银行";
                cell.secondLab.text = @"开户城市";
                cell.secondNameLab.text = @"北京";
                cell.thirdLab.text = @"开户行";
                cell.thirdNmaeLab.text = @"上地三街建设银行";
                cell.forthLab.text = @"银行卡号";
                cell.forthNameLab.text = @"432143214321";
            }
            else
            {
                cell.firstLab.text = @"报销日期";
                cell.firstNameLab.text = @"2015-11-11";
                cell.secondLab.text = @"货币类型";
                cell.secondNameLab.text = @"CNY";
                cell.thirdLab.text = @"报销方式";
                cell.thirdNmaeLab.text = @"全额报销";
                cell.forthLab.text = @"借款金额";
                cell.forthNameLab.text = @"";
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
    }
    else
    {
        strokeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"strokeCell"];
        if(cell==nil){
            cell = (strokeCell*)[[self.strokeNib instantiateWithOwner:self options:nil] objectAtIndex:0];
            
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 80;
        }
        else
        {
            return 130;
        }
    }
    else
    {
        return 120;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 1;
    }
    return 155;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1&& indexPath.row == 0) {
        ReimbursDetailViewController* ReimbursDetailView = [[ReimbursDetailViewController alloc] initWithNibName:@"ReimbursDetailViewController" bundle:nil];
        [self.navigationController pushViewController:ReimbursDetailView animated:YES];
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 155)];
    v_footer.backgroundColor = UIColorFromRGB(0x337da7);
    NSArray* titles = @[@"金额总计",@"扣除借款",@"实际报销"];
    for (int i = 0; i < 3; i ++) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10+30*i, 90, 30)];
        label.font = FONT(15);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titles[i];
        [v_footer addSubview:label];
        
        UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 10+30*i, SCREEN_WIDTH- 180, 30)];
        textField.textColor = [UIColor whiteColor];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        if (i == 0) {
            textField.enabled = NO;
            textField.text = @"555";
        }
        else
        {
            textField.placeholder = @"请输入金额";
            textField.delegate = self;
        }
        [v_footer addSubview:textField];
        
        
        UILabel* riglabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 10+30*i, 90, 30)];
        riglabel.font = FONT(15);
        riglabel.textColor = [UIColor whiteColor];
        riglabel.textAlignment = NSTextAlignmentCenter;
        riglabel.text = @"CNY";
        [v_footer addSubview:riglabel];
    }
    
    UIButton* applyforBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    applyforBtn.tag = 101;
    applyforBtn.backgroundColor = UIColorFromRGB(0xecf3f7);
    [applyforBtn.layer setMasksToBounds:YES];
    [applyforBtn.layer setCornerRadius:4]; //设置矩形四个圆角半径
    //    [loginout.layer setBorderWidth:1.0]; //边框
    applyforBtn.frame = CGRectMake(40, 110, SCREEN_WIDTH -80 , 40);
    [applyforBtn setTitle:@"申请" forState:UIControlStateNormal];
    [applyforBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [applyforBtn addTarget:self action:@selector(applyforBtn) forControlEvents:UIControlEventTouchUpInside];
    [v_footer addSubview:applyforBtn];
    return v_footer;
}

-(void)applyforBtn
{
    DLog(@"申请");
    ApprovalProcessViewController *ApprovalProcessView= [[ApprovalProcessViewController alloc] initWithNibName:@"ApprovalProcessViewController" bundle:nil];
    [self.navigationController pushViewController:ApprovalProcessView animated:YES];
}
@end
