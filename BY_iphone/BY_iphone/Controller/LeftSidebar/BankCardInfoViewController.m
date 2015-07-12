//
//  BankCardInfoViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "BankCardInfoViewController.h"
#import "FullBankCodeViewController.h"
#import "PersonalinfoCell.h"
@interface BankCardInfoViewController ()
@property UINib* PersonalinfoNib;
@end

@implementation BankCardInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"银行卡信息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addBankCard)];
    
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addBankCard
{
    DLog(@"添加");
    FullBankCodeViewController* FullBankCodeView = [[FullBankCodeViewController alloc] initWithNibName:@"FullBankCodeViewController" bundle:nil];
    FullBankCodeView.addorfulltype = add_bankcard_type;
    [self.navigationController pushViewController:FullBankCodeView animated:YES];
}

-(void)setupView
{
    self.items = @[@"开户行名称",@"开户城市",@"开户行",@"银行卡号"];
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
    cell.namelab.text = @"111";
    cell.namelab.textAlignment = NSTextAlignmentLeft;
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
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 80;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    
    UIButton* ConfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ConfirmBtn.tag = 101;
    ConfirmBtn.backgroundColor = UIColorFromRGB(0x171c61);
    [ConfirmBtn.layer setMasksToBounds:YES];
    [ConfirmBtn.layer setCornerRadius:4]; //设置矩形四个圆角半径
    //    [loginout.layer setBorderWidth:1.0]; //边框
    ConfirmBtn.frame = CGRectMake(40, 40, SCREEN_WIDTH -80 , 40);
    [ConfirmBtn setTitle:@"修改" forState:UIControlStateNormal];
    [ConfirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ConfirmBtn addTarget:self action:@selector(ConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [v_footer addSubview:ConfirmBtn];
    
    return v_footer;
}
-(void)ConfirmBtn
{
    DLog(@"确认");
    FullBankCodeViewController* FullBankCodeView = [[FullBankCodeViewController alloc] initWithNibName:@"FullBankCodeViewController" bundle:nil];
    FullBankCodeView.addorfulltype = modify_bankcard_type;
    [self.navigationController pushViewController:FullBankCodeView animated:YES];
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
