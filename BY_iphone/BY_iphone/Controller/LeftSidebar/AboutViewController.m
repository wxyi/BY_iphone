//
//  AboutViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"关于我们";
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupView
{
    
    self.tableview.delegate = self;
    self.tableview.dataSource =self;
    self.tableview.scrollEnabled = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
 
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
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"博彦办公助手";
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_WIDTH * 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_HEIGHT -50 - SCREEN_WIDTH * 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* v_header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH* 0.5)];
    v_header.backgroundColor = [UIColor clearColor];
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_WIDTH* 0.5 -100)/2, 100, 100)];
    image.image = [UIImage imageNamed:@"icon_logo_login.png"];
    [v_header addSubview:image];
    
    UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, image.frame.origin.y + CGRectGetHeight(image.frame) , SCREEN_WIDTH, 40)];
    titleLab.text = [ConfigManager sharedInstance].sysVersion;
    titleLab.textColor = UIColorFromRGB(0x646464);
    titleLab.font = FONT(20);
    titleLab.textAlignment = NSTextAlignmentCenter;
    
    [v_header addSubview:titleLab];
    return v_header;
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
