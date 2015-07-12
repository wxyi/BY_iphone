//
//  FullBankCodeViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "FullBankCodeViewController.h"
#import "FullSubInfoCell.h"
#import "ZHPickView.h"
#import "QCheckBox.h"
#import "FullOtherInfoViewController.h"
@interface FullBankCodeViewController ()<ZHPickViewDelegate,QCheckBoxDelegate>
@property(nonatomic,strong)ZHPickView *BankPickview;
@property(nonatomic,strong)ZHPickView *CityPickview;
@property UINib* FullSubInfoNib;
@end

@implementation FullBankCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString* strtitle;
    
    if  (self.addorfulltype == modify_bankcard_type) {
        strtitle = @"修改银行卡";
    }
    else
        strtitle = @"填写银行卡";
    self.title = strtitle;
    [self setupView];
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
    self.FullSubInfoNib = [UINib nibWithNibName:@"FullSubInfoCell" bundle:nil];
    [self selectPickType];
    
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
    FullSubInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FullSubInfoCell"];
    if(cell==nil){
        cell = (FullSubInfoCell*)[[self.FullSubInfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    cell.namelab.text = self.items[indexPath.row][@"title"];
    cell.nametext.placeholder = self.items[indexPath.row][@"placeholder"];
    if (indexPath.row == 0 ||indexPath.row == 1) {
        [cell setupFullCell];
        cell.nametext.inputView = self.items[indexPath.row][@"intView"];
        cell.nametext.tag = [[NSString stringWithFormat:@"1000%ld",(long)indexPath.row] integerValue];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 90;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
    
    NSString* titlebtn;
    if (self.addorfulltype == full_bankcard_type) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        view.backgroundColor = [UIColor whiteColor];
        
        [v_footer addSubview:view];
        
        QCheckBox *_check1 = [[QCheckBox alloc] initWithDelegate:self];
        _check1.frame = CGRectMake(SCREEN_WIDTH - 95, 0, 80, 30);
        [_check1 setTitle:@"现金报销" forState:UIControlStateNormal];
        [_check1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_check1.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [view addSubview:_check1];
        titlebtn = @"下一步";
    }
    else if(self.addorfulltype == modify_bankcard_type)
    {
        titlebtn = @"确认修改";
    }
    else
    {
        titlebtn = @"确认";
    }
    
//    [_check1 setChecked:YES];
    
    
    UIButton* nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.tag = 101;
    nextBtn.backgroundColor = UIColorFromRGB(0x171c61);
    [nextBtn.layer setMasksToBounds:YES];
    [nextBtn.layer setCornerRadius:4]; //设置矩形四个圆角半径
    //    [loginout.layer setBorderWidth:1.0]; //边框
    nextBtn.frame = CGRectMake(40, 50, SCREEN_WIDTH -80 , 40);
    
    [nextBtn setTitle:titlebtn forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtn) forControlEvents:UIControlEventTouchUpInside];
    [v_footer addSubview:nextBtn];
    
    return v_footer;
}

-(void)nextBtn
{
    DLog(@"下一步");
    [_BankPickview remove];
    [_CityPickview remove];
    
    if (self.addorfulltype == full_bankcard_type) {
        FullOtherInfoViewController *FullOtherInfoView = [[FullOtherInfoViewController alloc] initWithNibName:@"FullOtherInfoViewController" bundle:nil];
        [self.navigationController pushViewController:FullOtherInfoView animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)selectPickType
{
    
    NSArray *array = @[@"工商银行",@"建设银行",@"中国银行",@"招商银行"];;
    
    _BankPickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _BankPickview.delegate=self;
    
    array = @[@"南京",@"太原",@"武汉"];
    _CityPickview = [[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _CityPickview.delegate=self;
    
    
    self.items = [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:@"开户行名称",@"title",@"招商银行",@"pickText",@"",@"placeholder",_BankPickview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"开户城市",@"title",@"武汉",@"pickText",@"",@"placeholder",_CityPickview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"开户行",@"title",@"",@"pickText",@"填写开户行",@"placeholder",nil,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"银行卡号",@"title",@"",@"pickText",@"填写银行卡号",@"placeholder",nil,@"intView", nil],nil];
    
    //    [_pickview show];
}

#pragma mark ZhpickVIewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
    NSInteger ntag;
    if (pickView == _BankPickview) {
        ntag = 10000;
    }
    else if(pickView == _CityPickview)
    {
        ntag = 10001;
    }
  
    UITextField* textfield = (UITextField*)[self.view viewWithTag:ntag];
    textfield.text = resultString;
}

#pragma mark - QCheckBoxDelegate

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    NSLog(@"did tap on CheckBox:%@ checked:%d", checkbox.titleLabel.text, checked);
    if (checked) {
        UITextField* textfield = (UITextField*)[self.view viewWithTag:10000];
        textfield.enabled = NO;
        textfield.backgroundColor = [UIColor lightGrayColor];
        textfield = (UITextField*)[self.view viewWithTag:10001];
        textfield.enabled = NO;
        textfield.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        UITextField* textfield = (UITextField*)[self.view viewWithTag:10000];
        textfield.enabled = YES;
        textfield.backgroundColor = [UIColor whiteColor];
        textfield = (UITextField*)[self.view viewWithTag:10001];
        textfield.enabled = YES;
        textfield.backgroundColor = [UIColor whiteColor];
    }
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
