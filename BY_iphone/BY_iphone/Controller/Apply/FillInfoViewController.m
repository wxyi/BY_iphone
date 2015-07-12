//
//  FillInfoViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "FillInfoViewController.h"
#import "FullInfoCell.h"
#import "FullSubInfoCell.h"
#import "ZHPickView.h"
#import "FullBankCodeViewController.h"
@interface FillInfoViewController ()<ZHPickViewDelegate>
@property(nonatomic,strong)ZHPickView *ApplyTypeview;
@property(nonatomic,strong)ZHPickView *Assumeview;
@property(nonatomic,strong)ZHPickView *Costview;
@property UINib* FullInfoNib;
@property UINib* FullSubInfoNib;
@end

@implementation FillInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写信息";
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
//    [NSObject setExtraCellLineHidden:self.tableview];
    self.FullInfoNib = [UINib nibWithNibName:@"FullInfoCell" bundle:nil];
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
//        __weak typeof(self) weakSelf = self;
    if (indexPath.row == 0 || indexPath.row == 1) {
        FullInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FullInfoCell"];
        if(cell==nil){
            cell = (FullInfoCell*)[[self.FullInfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
            
        }
        
        cell.namelab.text = self.items[indexPath.row][@"title"];
        cell.Picktext.text = self.items[indexPath.row][@"pickText"];
        cell.Picktext.inputView = self.items[indexPath.row][@"intView"];
        cell.Fulltext.placeholder = self.items[indexPath.row][@"placeholder"];
        
        cell.Picktext.tag = [[NSString stringWithFormat:@"1000%ld",(long)indexPath.row] integerValue];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;

    }
    else
    {
        FullSubInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FullSubInfoCell"];
        if(cell==nil){
            cell = (FullSubInfoCell*)[[self.FullSubInfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
            
        }
        cell.namelab.text = self.items[indexPath.row][@"title"];
        cell.nametext.placeholder = self.items[indexPath.row][@"placeholder"];
        if (indexPath.row == 2) {
            [cell setupFullCell];
            cell.nametext.inputView = self.items[indexPath.row][@"intView"];
            cell.nametext.tag = [[NSString stringWithFormat:@"1000%ld",(long)indexPath.row] integerValue];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 ||indexPath.row == 1) {
        return 75;
    }
    else
    {
        return 44;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 80;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    
    UIButton* nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.tag = 101;
    nextBtn.backgroundColor = UIColorFromRGB(0x171c61);
    [nextBtn.layer setMasksToBounds:YES];
    [nextBtn.layer setCornerRadius:4]; //设置矩形四个圆角半径
    //    [loginout.layer setBorderWidth:1.0]; //边框
    nextBtn.frame = CGRectMake(40, 40, SCREEN_WIDTH -80 , 40);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtn) forControlEvents:UIControlEventTouchUpInside];
    [v_footer addSubview:nextBtn];
    
    return v_footer;
}

-(void)nextBtn
{
    DLog(@"下一步");
    [_ApplyTypeview remove];
    [_Assumeview remove];
    [_Costview remove];
    FullBankCodeViewController *FullBankCodeView = [[FullBankCodeViewController alloc] initWithNibName:@"FullBankCodeViewController" bundle:nil];
    FullBankCodeView.addorfulltype = full_bankcard_type;
    [self.navigationController pushViewController:FullBankCodeView animated:YES];
}
-(void)selectPickType
{

    NSArray *array = @[@"为他人报销",@"为自己报销",@"为自己报销"];;
    
    _ApplyTypeview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _ApplyTypeview.delegate=self;
    
    array = @[@"行政",@"人事",@"财务"];
    _Assumeview = [[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _Assumeview.delegate=self;
    
    array = @[@"1块",@"2块",@"3块"];
    _Costview = [[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _Costview.delegate=self;
    
    self.items = [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:@"报销类型",@"title",@"为他人报销",@"pickText",@"请填写IDCode",@"placeholder",_ApplyTypeview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"承担费用",@"title",@"自定义部门",@"pickText",@"请填写部门代码",@"placeholder",_Assumeview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"成本中心",@"title",@"",@"pickText",@"",@"placeholder",_Costview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"WBS",@"title",@"",@"pickText",@"请填写WBS",@"placeholder",nil,@"intView", nil],nil];
    
//    [_pickview show];
}

#pragma mark ZhpickVIewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
    NSInteger ntag;
    if (pickView == _ApplyTypeview) {
        ntag = 10000;
    }
    else if(pickView == _Assumeview)
    {
        ntag = 10001;
    }
    else if(pickView == _Costview)
    {
        ntag = 10002;
    }
    UITextField* textfield = (UITextField*)[self.view viewWithTag:ntag];
    textfield.text = resultString;
//    UITableViewCell * cell=[self.tableView cellForRowAtIndexPath:_indexPath];
//    cell.detailTextLabel.text=resultString;
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
