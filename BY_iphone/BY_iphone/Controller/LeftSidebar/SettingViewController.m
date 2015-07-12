//
//  SettingViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutViewController.h"
#import "VersionUpdatesViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
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
    self.tableview.scrollEnabled = NO;
}


#pragma mark -
#pragma mark UITableView Datasource



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //    cell.backgroundColor = UIColorFromRGB(0xf0f0f0);
    
    NSArray *titles = @[@"关于我们",@"版本更新"];

    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.textColor = UIColorFromRGB(0x646464);
    cell.textLabel.font = FONT(16);
    
   
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* v_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    
    UIButton* loginoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginoutBtn.tag = 101;
    loginoutBtn.backgroundColor = [UIColor redColor];
    [loginoutBtn.layer setMasksToBounds:YES];
    [loginoutBtn.layer setCornerRadius:4]; //设置矩形四个圆角半径
    //    [loginout.layer setBorderWidth:1.0]; //边框
    loginoutBtn.frame = CGRectMake(40, 40, SCREEN_WIDTH -80 , 40);
    loginoutBtn.titleLabel.font = FONT(15);
    [loginoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [loginoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginoutBtn addTarget:self action:@selector(loginout) forControlEvents:UIControlEventTouchUpInside];
    [v_footer addSubview:loginoutBtn];
    
    return v_footer;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AboutViewController* AboutView = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
        [self.navigationController pushViewController:AboutView animated:YES];
    }
    else
    {
        
        VersionUpdatesViewController* VersionUpdatesView = [[VersionUpdatesViewController alloc] initWithNibName:@"VersionUpdatesViewController" bundle:nil];
        [self.navigationController pushViewController:VersionUpdatesView animated:YES];
    }
}

-(void)loginout
{
    DLog(@"退出登陆");
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
