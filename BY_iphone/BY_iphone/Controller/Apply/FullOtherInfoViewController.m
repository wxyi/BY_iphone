//
//  FullOtherInfoViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "FullOtherInfoViewController.h"
#import "FullSubInfoCell.h"
#import "ZHPickView.h"
#import "ReimburseDetailViewController.h"


#import "SelectTypeViewController.h"

@interface FullOtherInfoViewController ()<ZHPickViewDelegate>
@property(nonatomic,strong)ZHPickView *Dataview;
@property(nonatomic,strong)ZHPickView *Currencyview;
@property(nonatomic,strong)ZHPickView *AppleTypeview;
@property(nonatomic,strong)ZHPickView *Deductionview;

@property UINib* FullSubInfoNib;

@end

@implementation FullOtherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他信息";
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
    //        __weak typeof(self) weakSelf = self;
    FullSubInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FullSubInfoCell"];
    if(cell==nil){
        cell = (FullSubInfoCell*)[[self.FullSubInfoNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    cell.namelab.text = self.items[indexPath.row][@"title"];
    cell.nametext.placeholder = self.items[indexPath.row][@"placeholder"];
    cell.nametext.text = self.items[indexPath.row][@"pickText"];
    cell.nametext.tag = [[NSString stringWithFormat:@"1000%ld",(long)indexPath.row] integerValue];
    switch (indexPath.row) {
        case 0:
            cell.nametext.inputView = _Dataview;
            break;
        case 1:
        case 2:
        case 3:
        {
            [cell setupFullCell];
            if (indexPath.row == 1) {
                cell.nametext.enabled = NO;
                cell.nametext.backgroundColor = [UIColor lightGrayColor];
            }
            cell.nametext.inputView = self.items[indexPath.row][@"intView"];
            
            break;
        }
        case 4:
        {
            cell.nametext.enabled = NO;
            break;
        }
        default:
            break;
    }
    cell.nametext.tag = [[NSString stringWithFormat:@"1000%ld",(long)indexPath.row] integerValue];
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
    [_Dataview remove];
    [_Currencyview remove];
    [_AppleTypeview remove];
    [_Deductionview remove];
    SelectTypeViewController * ReimburseDetailView = [[SelectTypeViewController alloc] initWithNibName:@"SelectTypeViewController" bundle:nil];
    [self.navigationController pushViewController:ReimburseDetailView animated:YES];
}
-(void)selectPickType
{
    
    
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
    _Dataview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
    _Dataview.delegate=self;
    
    NSArray *array = @[@"为他人报销",@"为自己报销",@"为自己报销"];;
    
    _Currencyview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _Currencyview.delegate=self;
    
    array = @[@"行政",@"人事",@"财务"];
    _AppleTypeview = [[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _AppleTypeview.delegate=self;
    
    array = @[@"1块",@"2块",@"3块"];
    _Deductionview = [[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _Deductionview.delegate=self;
    
    self.items = [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:@"报销日期",@"title",@"",@"pickText",@"填写日期",@"placeholder",_Dataview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"货币类型",@"title",@"CNY",@"pickText",@"",@"placeholder",_Currencyview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"报销方式",@"title",@"",@"pickText",@"",@"placeholder",_AppleTypeview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"扣减预借款",@"title",@"",@"pickText",@"",@"placeholder",_Deductionview,@"intView", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"汇率",@"title",@"1111",@"pickText",@"",@"placeholder",_Deductionview,@"intView", nil],nil];
    
    //    [_pickview show];
}

#pragma mark ZhpickVIewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
    NSInteger ntag;
    if (pickView == _Dataview) {
        ntag = 10000;
    }
    else if(pickView == _Currencyview)
    {
        ntag = 10001;
    }
    else if(pickView == _AppleTypeview)
    {
        ntag = 10002;
    }
    else if(pickView == _Deductionview)
    {
        ntag = 10003;
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
