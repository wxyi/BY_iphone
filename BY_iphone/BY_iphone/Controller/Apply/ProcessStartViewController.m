//
//  ProcessStartViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ProcessStartViewController.h"
#import "ProcessStartCell.h"
#import "FillInfoViewController.h"
@interface ProcessStartViewController ()
@property UINib* ProcessStartNib;
@end

@implementation ProcessStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"流程发起";
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
    [NSObject setExtraCellLineHidden:self.tableview];
    self.ProcessStartNib = [UINib nibWithNibName:@"ProcessStartCell" bundle:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    __weak typeof(self) weakSelf = self;
    ProcessStartCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ProcessStartCell"];
    if(cell==nil){
        cell = (ProcessStartCell*)[[self.ProcessStartNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    cell.processLab.text = self.strprocessName;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-190)/2, 0, 190, 40)];
    label.font = FONT(12);
    label.textColor = [UIColor orangeColor];
    [label setNumberOfLines:0];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = LocalString(@"pro_capion");
    [v_footer addSubview:label];
    
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
    FillInfoViewController* FillInfoView = [[FillInfoViewController alloc] initWithNibName:@"FillInfoViewController" bundle:nil];
    [self.navigationController pushViewController:FillInfoView animated:YES];
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
